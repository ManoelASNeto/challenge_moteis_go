import 'package:challenge_moteis_go/core/dio/dio_client.dart';

import '../../../../core/http_client/endpoints.dart';
import '../models/result_model.dart';

abstract class GonowRemoteDatasource {
  Future<ResultModel> getGoNow();
}

class GonowRemoteDatasourceImpl implements GonowRemoteDatasource {
  final DioClient dioClient;

  GonowRemoteDatasourceImpl({required this.dioClient});

  @override
  Future<ResultModel> getGoNow() async {
    final response = await dioClient.get(endPoint: Endpoints.json);
    return ResultModel.fromJson(response);
  }
}
