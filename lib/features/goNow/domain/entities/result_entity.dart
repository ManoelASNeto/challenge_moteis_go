import 'package:equatable/equatable.dart';

import 'package:challenge_moteis_go/features/goNow/domain/entities/data_entity.dart';

class ResultEntity extends Equatable {
  final bool? success;
  final DataEntity? data;
  final List<Null>? message;
  const ResultEntity({
    this.success,
    this.data,
    this.message,
  });
  @override
  List<Object?> get props => [
        success,
        data,
        message,
      ];
}
