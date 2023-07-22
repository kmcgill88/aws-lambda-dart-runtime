import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'apigateway_event.g.dart';

/// API Gateway Response contains the data for a response
/// to the API Gateway. It contains the [body] of the HTTP response.
/// It also contains a HTTP Status Code which by default is `200`.
/// Furthermore it indicates if the [body] is Base64 encoded or not.
class AwsApiGatewayResponse {
  /// The body of the HTTP Response send from the API Gateway to the client.
  String? body;

  /// Indicates if the [body] is Base64 encoded or not. By default is `false`.
  bool isBase64Encoded;

  // HTTP Status Code of the response of the API Gateway to the client.
  int statusCode;

  /// The HTTP headers that should be send with the response to the client.
  Map<String, String> headers;

  /// Returns the JSON representation of the response. This is called by
  /// the JSON encoder to produce the response.
  Map<String, dynamic> toJson() => {
        'body': body,
        'isBase64Encoded': isBase64Encoded,
        'statusCode': statusCode,
        'headers': headers
      };

  /// The factory creates a new [AwsApiGatewayResponse] from JSON.
  /// It optionally accepts the Base64 encoded flag and a HTTP Status Code
  /// for the response.
  factory AwsApiGatewayResponse.fromJson(
    Map<String, dynamic> body, {
    bool isBase64Encoded = false,
    int statusCode = 200,
    Map<String, String>? headers,
  }) {
    return AwsApiGatewayResponse(
      body: json.encode(body),
      isBase64Encoded: isBase64Encoded,
      headers: headers ?? {},
      statusCode: statusCode,
    );
  }

  /// The Response that should be returned by the API Gateway for the
  /// Lambda invocation. It has a [body] which reflects the body of the HTTP Response.
  /// But also it signals if the [body] is Base64 encoded and what the HTTP Status Code
  /// of the response is.
  AwsApiGatewayResponse({
    this.body,
    required this.headers,
    required this.isBase64Encoded,
    required this.statusCode,
  });
}

/// API Gateway Event ...
@JsonSerializable()
class AwsApiGatewayEvent {
  /// URL Path ...
  @JsonKey()
  final String path;

  /// Resource ...
  @JsonKey()
  final String resource;

  /// HTTP Method ...
  @JsonKey()
  final String httpMethod;

  /// Body ...
  @JsonKey()
  final String body;

  /// Headers ...
  @JsonKey()
  final AwsApiGatewayEventHeaders headers;

  /// Path Parameters ...
  @JsonKey()
  final Map<String, dynamic> pathParameters;

  /// Query String Parameters ...
  @JsonKey()
  final Map<String, dynamic> queryStringParameters;

  /// Stage Variables ...
  @JsonKey()
  final Map<String, dynamic> stageVariables;

  /// Request Context ...
  final AwsApiGatewayEventRequestContext requestContext;

  factory AwsApiGatewayEvent.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayEventFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayEventToJson(this);

  const AwsApiGatewayEvent(
      {required this.resource,
      required this.path,
      required this.httpMethod,
      required this.body,
      required this.headers,
      required this.queryStringParameters,
      required this.stageVariables,
      required this.requestContext,
      required this.pathParameters});
}

/// API Gateway Event Headers ...
@JsonSerializable()
class AwsApiGatewayEventHeaders {
  @JsonKey(name: "Accept")
  final String accept;

  @JsonKey(name: "Accept-Encoding")
  final String acceptEncoding;

  @JsonKey(name: "CloudFront-Forwarded-Proto")
  final String cloudfrontForwardProto;

  @JsonKey(name: "CloudFront-Is-Desktop-Viewer")
  final String cloudfrontIsDesktopViewer;

  @JsonKey(name: "CloudFront-Is-Mobile-Viewer")
  final String cloudfrontIsMobileViewer;

  @JsonKey(name: "CloudFront-Is-SmartTV-Viewer")
  final String cloudfrontIsSmartTvViewer;

  @JsonKey(name: "CloudFront-Is-Tablet-Viewer")
  final String cloudfrontIsTabletViewer;

  @JsonKey(name: "CloudFront-Viewer-Country")
  final String cloudfrontViewerCountry;

  @JsonKey(name: "Host")
  final String host;

  @JsonKey(name: "Upgrade-Insecure-Requests")
  final String upgradeInsecureRequests;

  @JsonKey(name: "User-Agent")
  final String userAgent;

  @JsonKey(name: "Via")
  final String via;

  @JsonKey(name: "X-Amz-Cf-Id")
  final String xAmzCfId;

  @JsonKey(name: "X-Forwarded-For")
  final String xForwardedFor;

  @JsonKey(name: "X-Forwarded-Port")
  final String xForwardedPort;

  @JsonKey(name: "X-Forwarded-Proto")
  final String xForwardedProto;

  @JsonKey(name: "Cache-Control")
  final String cacheControl;

  @JsonKey(name: "X-Amzn-Trace-Id")
  final String xAmznTraceId;

  @JsonKey(includeFromJson: false)
  Map<String, dynamic> raw = {};

  factory AwsApiGatewayEventHeaders.fromJson(Map<String, dynamic> json) {
    final event = _$AwsApiGatewayEventHeadersFromJson(json);
    event.raw = json;

    return event;
  }

  Map<String, dynamic> toJson() => _$AwsApiGatewayEventHeadersToJson(this);

  AwsApiGatewayEventHeaders(
      {required this.accept,
      required this.acceptEncoding,
      required this.cloudfrontIsDesktopViewer,
      required this.cloudfrontIsMobileViewer,
      required this.cloudfrontIsSmartTvViewer,
      required this.cloudfrontForwardProto,
      required this.cloudfrontIsTabletViewer,
      required this.cloudfrontViewerCountry,
      required this.upgradeInsecureRequests,
      required this.cacheControl,
      required this.host,
      required this.via,
      required this.userAgent,
      required this.xAmzCfId,
      required this.xAmznTraceId,
      required this.xForwardedFor,
      required this.xForwardedPort,
      required this.xForwardedProto});
}

/// API Gateway Event Request Context ...
@JsonSerializable()
class AwsApiGatewayEventRequestContext {
  @JsonKey()
  final String accountId;

  @JsonKey()
  final String resourceId;

  @JsonKey()
  final String stage;

  @JsonKey()
  final String requestId;

  @JsonKey()
  final String resourcePath;

  @JsonKey()
  final String httpMethod;

  @JsonKey()
  final String apiId;

  factory AwsApiGatewayEventRequestContext.fromJson(
          Map<String, dynamic> json) =>
      _$AwsApiGatewayEventRequestContextFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsApiGatewayEventRequestContextToJson(this);

  const AwsApiGatewayEventRequestContext({
    required this.accountId,
    required this.resourceId,
    required this.stage,
    required this.requestId,
    required this.resourcePath,
    required this.httpMethod,
    required this.apiId,
  });
}

/// API Gateway Event Identity
@JsonSerializable()
class AwsApiGatewayEventRequestContextIdentity {
  @JsonKey()
  final String cognitoIdentityPoolId;

  @JsonKey()
  final String accountId;

  @JsonKey()
  final String cognitoIdentityId;

  @JsonKey()
  final String caller;

  @JsonKey()
  final String apiKey;

  @JsonKey()
  final String sourceIp;

  @JsonKey()
  final String cognitoAuthenticationType;

  @JsonKey()
  final String cognitoAuthenticationProvider;

  @JsonKey()
  final String userArn;

  @JsonKey()
  final String userAgent;

  @JsonKey()
  final String user;

  factory AwsApiGatewayEventRequestContextIdentity.fromJson(
          Map<String, dynamic> json) =>
      _$AwsApiGatewayEventRequestContextIdentityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsApiGatewayEventRequestContextIdentityToJson(this);

  const AwsApiGatewayEventRequestContextIdentity(
      {required this.cognitoIdentityPoolId,
      required this.cognitoAuthenticationProvider,
      required this.cognitoAuthenticationType,
      required this.caller,
      required this.accountId,
      required this.cognitoIdentityId,
      required this.apiKey,
      required this.sourceIp,
      required this.user,
      required this.userAgent,
      required this.userArn});
}
