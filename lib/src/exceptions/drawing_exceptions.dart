class DrawingException implements Exception {
  final String message;

  const DrawingException([this.message = ""]);

  @override
  String toString() {
    return 'DrawingException: $message';
  }
}
