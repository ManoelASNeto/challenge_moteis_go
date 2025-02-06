import 'endpoints.dart';
import '../../injection_container.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

abstract class HttpClient {
  Future<dynamic> get({required String endpoint});
}

class HttpClientImpl implements HttpClient {
  final http.Client _client = sl<http.Client>();

  @override
  Future<dynamic> get({required String endpoint}) async {
    try {
      final response = await _client.get(Uri.parse('${Endpoints.url}$endpoint'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return _handleError(response);
      }
    } catch (e) {
      return 'Connection Error: $e';
    }
  }

  dynamic _handleError(http.Response response) {
    switch (response.statusCode) {
      case 400:
        return 'Bad Request: ${response.body}';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 500:
        return 'Internal Server Error';
      default:
        return 'Unexpected Error: ${response.statusCode}';
    }
  }
}
