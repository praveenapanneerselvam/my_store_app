class File {
  final String path;
  File(this.path);

  Future<void> writeAsBytes(List<int> bytes) async {
    throw UnsupportedError("File system is not supported on web.");
  }
}
