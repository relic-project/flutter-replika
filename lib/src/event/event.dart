import 'package:replika/replika.dart';

enum EventType {
  error,
  warning,
  info,
  debug,
  message
}

class ReplikaEvent {
  EventType type;
  Map<String, dynamic> data;
  StackTrace? stackTrace;
  String? message;
  ReplikaInfo info = ReplikaInfo();

  ReplikaEvent({required this.type, required this.data, this.stackTrace, this.message});

  @override
  String toString() {
    return "Event(type: $type, data: $data, message: $message, stackTrace: $stackTrace, info: $info)";
  }
}