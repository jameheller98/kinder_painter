import 'package:master_source_flutter/src/api/api.dart';

class NotificationAPI extends API {
  Uri updateFCMToken() => super.buildUri(
        endpoint: 'notification/fcm-token',
        parametersBuilder: () => paramQueryParameters(null),
      );

  Map<String, dynamic>? paramQueryParameters(String? param) => param != null
      ? {
          "param": param,
        }
      : null;
}
