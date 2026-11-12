import "package:test/test.dart";

import "dart:async";
import "dart:convert";
import "dart:io";

import 'package:aws_lambda_dart_runtime/client/client.dart';

/// A next-invocation body large enough that the AWS runtime API delivers it
/// in multiple HTTP chunks in production (observed split at character 3,565,
/// 2026-11-07 production incidents).
String _chunkedBodyJson() {
  final filler = 'x' * 4000;
  return '{"payload":{"filler":"$filler","ok":true}}';
}

class _RuntimeHeaders implements HttpHeaders {
  final Map<String, String> values;
  _RuntimeHeaders(this.values);
  @override
  String? value(String name) => values[name];
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _ChunkedResponse extends Stream<List<int>> implements HttpClientResponse {
  final Stream<List<int>> _body;
  final HttpHeaders _headers;
  _ChunkedResponse(this._body, this._headers);
  @override
  HttpHeaders get headers => _headers;
  @override
  int get statusCode => 200;
  @override
  StreamSubscription<List<int>> listen(
    void Function(List<int>)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      _body.listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError,
      );
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

HttpClientResponse _responseSplitAt(String body, int split) {
  final bytes = utf8.encode(body);
  final controller = StreamController<List<int>>();
  controller.add(bytes.sublist(0, split));
  controller.add(bytes.sublist(split));
  controller.close();
  return _ChunkedResponse(
    controller.stream,
    _RuntimeHeaders({
      NextInvocation.runtimeRequestId: 'regression-request',
      NextInvocation.runtimeDeadlineMs: '2000000000000',
      NextInvocation.runtimeInvokedFunctionArn: 'regression-function',
    }),
  );
}

void main() {
  group('invocation', () {
    test("invocation result gets populated", () {
      final result = InvocationResult(body: "SUCCESS", requestId: "1234567890");

      expect(result.requestId, "1234567890");
      expect(result.body, "SUCCESS");
    });

    test("invocation error gets populated", () {
      final stateError = new StateError("foo");
      final invocationError = InvocationError(
        error: stateError,
        stackTrace: new StackTrace.fromString(""),
      );

      expect(invocationError.error, stateError);
    });
  });

  group('NextInvocation.fromResponse', () {
    test('decodes a body delivered in a single chunk', () async {
      final next = await NextInvocation.fromResponse(
        _responseSplitAt(_chunkedBodyJson(), _chunkedBodyJson().length),
      );
      expect(next.requestId, 'regression-request');
      expect(next.response['payload']['ok'], true);
    });

    test(
        'decodes a body split across HTTP chunks at the production boundary '
        '(regression: 2026-11-07 crashes at character 3,565)', () async {
      final next = await NextInvocation.fromResponse(
        _responseSplitAt(_chunkedBodyJson(), 3564),
      );
      expect(
        next.response['payload']['ok'],
        true,
        reason: 'the decoder must aggregate the FULL body before parsing',
      );
    });
  });
}
