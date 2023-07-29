import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import 'package:master_source_flutter/src/api/notification_api.dart';
import 'package:master_source_flutter/src/exceptions/push_notification_exception.dart';

class PushNotificationConfig {
  final NotificationAPI api;
  final http.Client client;

  PushNotificationConfig.init({required this.api, required this.client}) {
    setupPushNotification();
  }

  void setupPushNotification() async {
    try {
      final fcm = FirebaseMessaging.instance;

      await Future.delayed(const Duration(milliseconds: 750));

      await fcm.requestPermission();

      final token = await fcm.getToken();

      // ignore: avoid_print
      print(token);
      // if (token != null) {
      //   await client.post(
      //     api.updateFCMToken(),
      //     body: {
      //       'fcm_token': token,
      //     },
      //   );
      // }
    } on PushNotificationException catch (_) {
      throw const PushNotificationException(
          'Something wrong when get and save fcm token!');
    }
  }
}
