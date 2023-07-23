import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';


/// Event is the abstraction for every event that
/// can be ingested by a handler.
///
/// Note is currently not supported to register your
/// own events here.
abstract class Event {
  static final _registry = {
    AwsApiGatewayEvent: (Map<String, dynamic> json) => AwsApiGatewayEvent.fromJson(json),
    AwsApiGatewayV2Event: (Map<String, dynamic> json) => AwsApiGatewayV2Event.fromJson(json),
  };

  /// Checks if a type of event is already registered.
  static bool exists<T>() {
    return Event._registry.containsKey(T);
  }

  /// Returns the value of a registered event. It is [null]
  /// if no such event has been registered.
  static value<T>() {
    return Event._registry[T];
  }

  /// Registers an event.
  static void registerEvent<T>(func) {
    Event._registry[T] = func;
  }

  /// Deregisters an event.
  static deregisterEvent<T>() {
    Event._registry.remove(T);
  }

  /// Creates a new event from a handler type with the [NextInvocation.response].
  static fromHandler<T>(Type type, Map<String, dynamic> json) {
    // if (!exists()) {
    //   throw RuntimeException('No handler registered with type "${type}"');
    // }
    return _registry[type]!(json);
  }
}
