import 'package:master_source_flutter/src/api/api.dart';

class CommonAPI extends API {
  Uri common(String param) => super.buildUri(
        endpoint: 'common',
        parametersBuilder: () => paramQueryParameters(null),
      );

  Map<String, dynamic>? paramQueryParameters(String? param) => param != null
      ? {
          "param": param,
        }
      : null;
}

class DrawingAPI extends API {
  Uri common(String param) => super.buildUri(
        endpoint: 'common',
        parametersBuilder: () => paramQueryParameters(null),
      );

  Map<String, dynamic>? paramQueryParameters(String? param) => param != null
      ? {
          "param": param,
        }
      : null;
}
