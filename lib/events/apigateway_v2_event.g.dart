// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apigateway_v2_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsApiGatewayV2Event _$AwsApiGatewayV2EventFromJson(
        Map<String, dynamic> json) =>
    AwsApiGatewayV2Event(
      rawPath: json['rawPath'] as String,
      rawQueryString: json['rawQueryString'] as String?,
      version: json['version'] as String,
      body: json['body'] as String?,
      headers: json['headers'] as Map<String, dynamic>,
      requestContext: AwsApiGatewayV2EventRequestContext.fromJson(
          json['requestContext'] as Map<String, dynamic>),
      isBase64Encoded: json['isBase64Encoded'] as bool,
      routeKey: json['routeKey'] as String?,
      queryStringParameters:
          json['queryStringParameters'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AwsApiGatewayV2EventToJson(
        AwsApiGatewayV2Event instance) =>
    <String, dynamic>{
      'version': instance.version,
      'routeKey': instance.routeKey,
      'rawPath': instance.rawPath,
      'rawQueryString': instance.rawQueryString,
      'body': instance.body,
      'headers': instance.headers,
      'queryStringParameters': instance.queryStringParameters,
      'isBase64Encoded': instance.isBase64Encoded,
      'requestContext': instance.requestContext,
    };

AwsApiGatewayV2EventRequestContext _$AwsApiGatewayV2EventRequestContextFromJson(
        Map<String, dynamic> json) =>
    AwsApiGatewayV2EventRequestContext(
      http: AwsApiGatewayV2EventRequestContextHttp.fromJson(
          json['http'] as Map<String, dynamic>),
      accountId: json['accountId'] as String,
      apiId: json['apiId'] as String,
      domainName: json['domainName'] as String,
      domainPrefix: json['domainPrefix'] as String,
      requestId: json['requestId'] as String,
      routeKey: json['routeKey'] as String,
      stage: json['stage'] as String,
      time: json['time'] as String,
      timeEpoch: json['timeEpoch'] as int,
    );

Map<String, dynamic> _$AwsApiGatewayV2EventRequestContextToJson(
        AwsApiGatewayV2EventRequestContext instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'apiId': instance.apiId,
      'domainName': instance.domainName,
      'domainPrefix': instance.domainPrefix,
      'http': instance.http,
      'requestId': instance.requestId,
      'routeKey': instance.routeKey,
      'stage': instance.stage,
      'time': instance.time,
      'timeEpoch': instance.timeEpoch,
    };

AwsApiGatewayV2EventRequestContextHttp
    _$AwsApiGatewayV2EventRequestContextHttpFromJson(
            Map<String, dynamic> json) =>
        AwsApiGatewayV2EventRequestContextHttp(
          method: json['method'] as String,
          path: json['path'] as String,
          protocol: json['protocol'] as String,
          sourceIp: json['sourceIp'] as String,
          userAgent: json['userAgent'] as String,
        );

Map<String, dynamic> _$AwsApiGatewayV2EventRequestContextHttpToJson(
        AwsApiGatewayV2EventRequestContextHttp instance) =>
    <String, dynamic>{
      'method': instance.method,
      'path': instance.path,
      'protocol': instance.protocol,
      'sourceIp': instance.sourceIp,
      'userAgent': instance.userAgent,
    };
