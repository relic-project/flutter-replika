import 'package:replika/replika.dart';

void main() {
  // create an instance of ReplikaOptions with your token and project id
  ReplikaOptions options = ReplikaOptions(token: "token", projectId: "project-id");

  // create an instance of Replika
  Replika replika = Replika();

  // create an event instance
  ReplikaEvent event = ReplikaEvent(type: EventType.message, data: {"test": "test"});

  // create an event programmatically
  replika.createEvent(options, event);

  // send an event programmatically
  Replika.sendEvent(options, event);

  // wrap your code with init
  Replika.init(() {
    // your code here
  }, options);
}
