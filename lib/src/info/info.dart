import 'dart:io' show Platform;

// class to save info about the current platform
class ReplikaInfo {

  String? operatingSystem;
  String? version;

  ReplikaInfo() {
    operatingSystem = Platform.operatingSystem;
    version = Platform.version;
  }

}