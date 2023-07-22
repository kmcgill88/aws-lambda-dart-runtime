import 'package:json_annotation/json_annotation.dart';

part 'apigateway_v2_event.g.dart';

/// API Gateway Event ...
@JsonSerializable()
class AwsApiGatewayV2Event {
  /// "version": "2.0",
  @JsonKey()
  final String version;

  /// "routeKey": "$default",
  @JsonKey()
  final String routeKey;

  /// "rawPath": "/my/path",
  @JsonKey()
  final String rawPath;

  /// "rawQueryString": "parameter1=value1&parameter1=value2&parameter2=value",
  @JsonKey()
  final String? rawQueryString;

  /// Body ...
  @JsonKey()
  final String? body;

  /// Headers ...
  @JsonKey()
  final Map<String, dynamic> headers;

  /// Query String Parameters ...
  @JsonKey()
  final Map<String, dynamic> queryStringParameters;

  @JsonKey()
  final bool isBase64Encoded;

  /// Request Context ...
  final AwsApiGatewayV2EventRequestContext requestContext;

  factory AwsApiGatewayV2Event.fromJson(Map<String, dynamic> json) =>
      _$AwsApiGatewayV2EventFromJson(json);

  Map<String, dynamic> toJson() => _$AwsApiGatewayV2EventToJson(this);

  const AwsApiGatewayV2Event({
    required this.routeKey,
    required this.rawPath,
    required this.rawQueryString,
    required this.version,
    required this.body,
    required this.headers,
    required this.queryStringParameters,
    required this.requestContext,
    required this.isBase64Encoded,
  });
}

/// API Gateway Event Request Context ...
@JsonSerializable()
class AwsApiGatewayV2EventRequestContext {
  // "accountId": "123456789012",
  @JsonKey()
  final String accountId;

  // "apiId": "<urlid>",
  @JsonKey()
  final String apiId;

  //"domainName": "<url-id>.lambda-url.us-west-2.on.aws",
  @JsonKey()
  final String domainName;

  //"domainPrefix": "<url-id>",
  @JsonKey()
  final String domainPrefix;

  @JsonKey()
  final AwsApiGatewayV2EventRequestContextHttp http;

  // "requestId": "id",
  @JsonKey()
  final String requestId;

  //"routeKey": "$default",
  @JsonKey()
  final String routeKey;

  //"stage": "$default",
  @JsonKey()
  final String stage;

  // "time": "12/Mar/2020:19:03:58 +0000",
  @JsonKey()
  final String time;

  // "timeEpoch": 1583348638390
  @JsonKey()
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
    required this.routeKey,
    required this.stage,
    required this.time,
    required this.timeEpoch,
  });
}

/// API Gateway Event Identity
@JsonSerializable()
class AwsApiGatewayV2EventRequestContextHttp {
  @JsonKey()
  final String method;

  @JsonKey()
  final String path;

  @JsonKey()
  final String protocol;

  @JsonKey()
  final String sourceIp;

  @JsonKey()
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
