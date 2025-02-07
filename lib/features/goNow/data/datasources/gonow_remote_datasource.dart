import '../../../../core/http_client/endpoints.dart';
import '../../../../core/http_client/http_client.dart';
import '../models/result_model.dart';

abstract class GonowRemoteDatasource {
  Future<ResultModel> getGoNow();
}

class GonowRemoteDatasourceImpl implements GonowRemoteDatasource {
  final HttpClient client;

  GonowRemoteDatasourceImpl({required this.client});

  @override
  Future<ResultModel> getGoNow() async {
    final client = HttpClientImpl();
    final response = await client.get(endpoint: Endpoints.json);
    return ResultModel.fromJson(response);
  }
}
