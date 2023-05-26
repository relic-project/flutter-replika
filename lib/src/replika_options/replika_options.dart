class ReplikaOptions {
  final String token;
  final String projectId;

  ReplikaOptions({
    required this.token,
    required this.projectId
  });

  @override
  String toString() {
    return "ReplikaOptions(token: $token, projectId: $projectId)";
  }
}