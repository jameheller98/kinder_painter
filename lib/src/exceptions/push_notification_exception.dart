class PushNotificationException implements Exception {
  final String message;

  const PushNotificationException([this.message = ""]);

  @override
  String toString() {
    return 'PushNotificationException: $message';
  }
}
