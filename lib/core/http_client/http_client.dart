import 'package:challenge_moteis_go/core/exception/network_exception.dart';
import 'package:challenge_moteis_go/core/ui/apps_strings.dart';

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
        return json.decode(
          utf8.decode(
            response.bodyBytes,
          ),
        );
      } else {
        return _handleResponse(response);
      }
    } catch (e) {
      return '${AppsStrings.connectionError} $e';
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(utf8.decode(response.bodyBytes));
      case 400:
        throw NetworkException(message: '${AppsStrings.invalidRequest} ${response.body}');
      case 401:
        throw NetworkException(message: AppsStrings.unauthorized);
      case 403:
        throw NetworkException(message: AppsStrings.accessProhibited);
      case 404:
        throw NetworkException(message: AppsStrings.resourceNotFound);
      case 429:
        throw NetworkException(message: AppsStrings.manyRequests);
      case 500:
        throw NetworkException(message: AppsStrings.internalError);
      case 502:
        throw NetworkException(message: AppsStrings.badGateway);
      case 503:
        throw NetworkException(message: AppsStrings.serviceUnavailable);
      default:
        throw NetworkException(message: '${AppsStrings.unexpectedError} ${response.statusCode}');
    }
  }
}
