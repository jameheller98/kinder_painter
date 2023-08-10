class MaterialException implements Exception {
  final String message;

  const MaterialException([this.message = ""]);

  @override
  String toString() {
    return 'DrawingException: $message';
  }
}
