import 'package:challenge_moteis_go/core/http_client/endpoints.dart';
import 'package:challenge_moteis_go/injection_container.dart';
import 'package:dio/dio.dart';

abstract class DioClient {
  Future<dynamic> get({required String endPoint});
}

class DioClientImpl implements DioClient {
  final _dio = sl<Dio>();

  @override
  Future get({required String endPoint}) async {
    try {
      final response = await _dio.get('${Endpoints.url}$endPoint');
      return response.data;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    if (error.response != null) {
      switch (error.response?.statusCode) {
        case 400:
          return 'Bad Request: ${error.response?.data}';
        case 401:
          return 'Unauthorized';
        case 403:
          return 'Forbidden';
        case 404:
          return 'Not Found';
        case 500:
          return 'Internal Server Error';
        default:
          return 'Unexpected Error: ${error.response?.statusCode}';
      }
    } else {
      if (error.type == DioExceptionType.connectionTimeout) {
        return 'Connection Timeout';
      } else if (error.type == DioExceptionType.receiveTimeout) {
        return 'Receive Timeout';
      } else if (error.type == DioExceptionType.unknown) {
        return 'Connection Error: ${error.message}';
      } else {
        return 'Unexpected Error';
      }
    }
  }
}
