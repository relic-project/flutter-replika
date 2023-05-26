import 'package:replika/replika.dart';
import 'package:dio/dio.dart';

class Replika {
  void createEvent(ReplikaOptions options, ReplikaEvent event) {
    sendEvent(options, event);
  }

  static void sendEvent(ReplikaOptions options, ReplikaEvent event) async {
    Dio dio = Dio();
    try {
      await dio.post(
        "https://replika.relic.it/error/${options.projectId}/", 
        data: event,
        options: Options(
          headers: {
            "replika-token": options.token,
            "Content-Type": "application/json"
          }
        )
      );
    } catch (e) {
      print("Error sending event to server: $e");
    }
  }

  static Future<void> init(dynamic child, ReplikaOptions options) async {    
    try {
      child();
    } catch (e, stackTrace) {
      sendEvent(
        options, 
        ReplikaEvent(
          type: EventType.error,
          stackTrace: stackTrace,
          data: {
            "error": e.toString()
          }
        )
      );
    }
  }

}
