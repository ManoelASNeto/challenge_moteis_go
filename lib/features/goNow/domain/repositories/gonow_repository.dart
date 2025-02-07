import 'package:challenge_moteis_go/features/goNow/domain/entities/result_entity.dart';

abstract class GonowRepository {
  Future<ResultEntity> getGoNowResult();
}
