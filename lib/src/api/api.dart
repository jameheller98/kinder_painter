class API {
  static const String _apiBaseUrl = 'first-grade-luggage.com';
  static const String _apiPath = '/api/';

  Uri buildUri({
    required String endpoint,
    required Map<String, dynamic>? Function() parametersBuilder,
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
      queryParameters: parametersBuilder(),
    );
  }
}
