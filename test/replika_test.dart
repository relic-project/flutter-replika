import 'package:replika/replika.dart';
import 'package:test/test.dart';

void main() {
  group("event", () {
    Replika.wrap(
      context: () async {
        throw Exception("Test exception");
      },
      options: ReplikaOptions(
        projectId: "test",
        token: "test"
      )
    );
  });
}
