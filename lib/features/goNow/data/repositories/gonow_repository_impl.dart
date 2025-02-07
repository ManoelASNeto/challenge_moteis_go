import '../datasources/gonow_remote_datasource.dart';
import '../../domain/entities/result_entity.dart';
import '../../domain/repositories/gonow_repository.dart';

class GonowRepositoryImpl implements GonowRepository {
  final GonowRemoteDatasource remoteDatasource;

  GonowRepositoryImpl({required this.remoteDatasource});

  @override
  Future<ResultEntity> getGoNowResult() async {
    final response = await remoteDatasource.getGoNow();
    return response.toEntity();
  }
}
