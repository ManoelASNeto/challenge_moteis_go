// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:challenge_moteis_go/features/goNow/domain/entities/result_entity.dart';
import 'package:challenge_moteis_go/features/goNow/domain/repositories/gonow_repository.dart';

class GonowUsecase {
  final GonowRepository repository;
  GonowUsecase({
    required this.repository,
  });

  Future<ResultEntity> call() async {
    return await repository.getGoNowResult();
  }
}
