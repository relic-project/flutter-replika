import 'dart:async';

import 'package:replika/replika.dart';
import 'package:dio/dio.dart';

typedef Context = FutureOr<void> Function();

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

  static Future<void> wrap({Context? context, required ReplikaOptions options}) async {   
    if (options.projectId == null){
      throw Exception("Project id is required");
    }
    if (options.token == null){
      throw Exception("Token is required");
    } 
    try {
      if (context != null){
        await context();
      }
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
