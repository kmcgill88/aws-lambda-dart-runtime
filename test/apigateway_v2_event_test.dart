import 'dart:io';
import 'dart:io' show File;
import 'dart:convert';

import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import "package:test/test.dart";

void main() {
  group("apigateway_default", () {
    test("json got parsed and creates an event", () async {
      final file = 'data/apigateway_v2_event.json';
      final String contents = new File(file).readAsStringSync();
      final Map<String, dynamic> json = jsonDecode(contents);
      final event = AwsApiGatewayV2Event.fromJson(json);

      expect(event.body, equals(jsonEncode({"foo": "bar"})));
      expect(event.rawPath, "/my/path");
      // expect(event.headers.acceptEncoding,
      //     equals("gzip, deflate, lzma, sdch, br"));
      expect(event.requestContext.http.method, "POST");
      // expect(event.requestContext.accountId, equals("123456789012"));
      // expect(event.requestContext.requestId,
      //     equals("41b45ea3-70b5-11e6-b7bd-69b5aaebc7d9"));
      // expect(event.queryStringParameters, equals({"name": "me"}));
      // expect(event.requestContext.resourcePath, equals("/{proxy+}"));
      // expect(event.headers.raw['Accept-Encoding'],
      //     equals("gzip, deflate, lzma, sdch, br"));
    });


    test("2 json got parsed and creates an event", () async {
      final file = 'data/apigateway_v2_event2.json';
      final String contents = new File(file).readAsStringSync();
      final Map<String, dynamic> json = jsonDecode(contents);
      final event = AwsApiGatewayV2Event.fromJson(json);

      expect(event.body, equals(jsonEncode({"foo": "bar"})));
      expect(event.rawPath, "/my/path");
      // expect(event.headers.acceptEncoding,
      //     equals("gzip, deflate, lzma, sdch, br"));
      expect(event.requestContext.http.method, "POST");
      // expect(event.requestContext.accountId, equals("123456789012"));
      // expect(event.requestContext.requestId,
      //     equals("41b45ea3-70b5-11e6-b7bd-69b5aaebc7d9"));
      // expect(event.queryStringParameters, equals({"name": "me"}));
      // expect(event.requestContext.resourcePath, equals("/{proxy+}"));
      // expect(event.headers.raw['Accept-Encoding'],
      //     equals("gzip, deflate, lzma, sdch, br"));
    });
  });
}
