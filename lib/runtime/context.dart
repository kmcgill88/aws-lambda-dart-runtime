import 'dart:io' show Platform;
import '../client/client.dart';

/// Context contains the Lambda execution context information.
/// They are either provided via [Platform.environment] or [NextInvocation]
/// which is the result from the Lambda API.
///
/// Note: this should not be used directly.
class Context {
  /// These are the constants used to map [Platform.environment]
  /// which are specific to the Lambda execution environment.
  static const _kAWSLambdaHandler = '_HANDLER';
  static const _kAWSLambdaFunctionName = 'AWS_LAMBDA_FUNCTION_NAME';
  static const _kAWSLambdaFunctionVersion = 'AWS_LAMBDA_FUNCTION_VERSION';
  static const _kAWSLambdaLogGroupName = 'AWS_LAMBDA_LOG_GROUP_NAME';
  static const _kAWSLambdaLogStreamName = 'AWS_LAMBDA_LOG_STREAM_NAME';
  static const _kAWSLambdaFunctionMemorySize =
      'AWS_LAMBDA_FUNCTION_MEMORY_SIZE';
  static const _kAWSLambdaRegion = 'AWS_REGION';
  static const _kAWSLambdaExecutionEnv = 'AWS_EXECUTION_ENV';
  static const _kAWSLambdaAccessKey = 'AWS_ACCESS_KEY_ID';
  static const _kAWSLambdaSecretAccesKey = 'AWS_SECRET_ACCESS_KEY';
  static const _kAWSLambdaSessionToken = 'AWS_SESSION_TOKEN';

  /// Creates a new [Context] from [NextInvocation] which is the data
  /// from the Lambda Runtime Interface for the next [Handler<T>] invocation.
  static fromNextInvocation(NextInvocation nextInvocation) {
    return Context(
      requestId: nextInvocation.requestId,
      invokedFunctionArn: nextInvocation.invokedFunctionArn ?? 'unknown',
    );
  }

  /// Handler that is used for the invocation of the function
  String? handler = Platform.environment[_kAWSLambdaHandler];

  /// Name of the function that is invoked.
  String? functionName = Platform.environment[_kAWSLambdaFunctionName];

  /// Version of the function that is invoked.
  String? functionVersion = Platform.environment[_kAWSLambdaFunctionVersion];

  /// Memory sized that is allocated to execution of the function.
  String? functionMemorySize = Platform.environment[_kAWSLambdaFunctionMemorySize];

  /// Cloudwatch LogGroup that is associated with the Lambda.
  String? logGroupName = Platform.environment[_kAWSLambdaLogGroupName];

  /// Cloudwach LogStream that is associated with the Lambda.
  String? logStreamName = Platform.environment[_kAWSLambdaLogStreamName];

  /// Region that this function exists in.
  String? region = Platform.environment[_kAWSLambdaRegion];

  /// The execution environment of the function.
  String? executionEnv = Platform.environment[_kAWSLambdaExecutionEnv];

  /// Access key that is acquired via STS.
  String? accessKey = Platform.environment[_kAWSLambdaAccessKey];

  /// Secret access key that is acquired via STS.
  String? secretAccessKey = Platform.environment[_kAWSLambdaSecretAccesKey];

  /// The session token from STS.
  String? sessionToken = Platform.environment[_kAWSLambdaSessionToken];

  /// Id of the request.
  /// You can use this to track the request for the invocation.
  String requestId;

  /// The ARN to identify the function.
  String invokedFunctionArn;

  Context({
    required this.requestId,
    required this.invokedFunctionArn
  });
}
