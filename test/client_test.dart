import "package:test/test.dart";

import 'package:aws_lambda_dart_runtime/client/client.dart';

void main() {
  group('invocation', () {
    test("invocation result gets populated", () {
      final result = InvocationResult(
        body: "SUCCESS",
        requestId: "1234567890",
      );

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
}
