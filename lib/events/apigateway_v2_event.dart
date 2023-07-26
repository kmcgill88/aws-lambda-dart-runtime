import 'package:json_annotation/json_annotation.dart';

part 'apigateway_v2_event.g.dart';

/// API Gateway Event ...
@JsonSerializable(explicitToJson: true)
class AwsApiGatewayV2Event {
  /// "version": "2.0",
  final String version;

  /// "routeKey": "$default",
  final String? routeKey;

  /// "rawPath": "/my/path",
  final String rawPath;

  /// "rawQueryString": "parameter1=value1&parameter1=value2&parameter2=value",
  final String? rawQueryString;

  /// Body ...
  final String? body;

  /// Headers ...
  final Map<String, dynamic> headers;

  /// Query String Parameters ...
  final Map<String, dynamic>? queryStringParameters;

  final bool isBase64Encoded;

  /// Request Context ...
  final AwsApiGatewayV2EventRequestContext requestContext;

  factory AwsApiGatewayV2Event.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayV2EventFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayV2EventToJson(this);

  const AwsApiGatewayV2Event({
    required this.rawPath,
    required this.rawQueryString,
    required this.version,
    required this.body,
    required this.headers,
    required this.requestContext,
    required this.isBase64Encoded,
    this.routeKey,
    this.queryStringParameters,
  });
}

/// API Gateway Event Request Context ...
@JsonSerializable(explicitToJson: true)
class AwsApiGatewayV2EventRequestContext {
  /// "accountId": "123456789012",
  final String accountId;

  /// "apiId": "<urlid>",
  final String apiId;

  /// "domainName": "<url-id>.lambda-url.us-west-2.on.aws",
  final String domainName;

  /// "domainPrefix": "<url-id>",
  final String domainPrefix;

  final AwsApiGatewayV2EventRequestContextHttp http;

  /// "requestId": "id",
  final String requestId;

  /// "routeKey": "$default",
  final String? routeKey;

  /// "stage": "$default",
  final String? stage;

  ///  "time": "12/Mar/2020:19:03:58 +0000",
  final String time;

  ///  "timeEpoch": 1583348638390
  final int timeEpoch;

  factory AwsApiGatewayV2EventRequestContext.fromJson(
          Map<String, dynamic> json) =>
      _$AwsApiGatewayV2EventRequestContextFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsApiGatewayV2EventRequestContextToJson(this);

  const AwsApiGatewayV2EventRequestContext({
    required this.http,
    required this.accountId,
    required this.apiId,
    required this.domainName,
    required this.domainPrefix,
    required this.requestId,
    required this.time,
    required this.timeEpoch,
    this.routeKey,
    this.stage,
  });
}

/// API Gateway Event Identity
@JsonSerializable()
class AwsApiGatewayV2EventRequestContextHttp {
  final String method;
  final String path;
  final String protocol;
  final String sourceIp;
  final String userAgent;

  factory AwsApiGatewayV2EventRequestContextHttp.fromJson(
          Map<String, dynamic> json) =>
      _$AwsApiGatewayV2EventRequestContextHttpFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AwsApiGatewayV2EventRequestContextHttpToJson(this);

  const AwsApiGatewayV2EventRequestContextHttp({
    required this.method,
    required this.path,
    required this.protocol,
    required this.sourceIp,
    required this.userAgent,
  });
}
