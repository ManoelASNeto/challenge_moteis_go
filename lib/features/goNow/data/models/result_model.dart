import 'package:challenge_moteis_go/features/goNow/domain/entities/result_entity.dart';
import 'package:equatable/equatable.dart';

import 'package:challenge_moteis_go/features/goNow/data/models/data_model.dart';

class ResultModel extends Equatable {
  final bool? success;
  final DataModel? dataModel;
  final List<String>? message;

  const ResultModel({
    this.success,
    this.dataModel,
    this.message,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        success: json['sucesso'] ?? false,
        dataModel: DataModel.fromJson(json['data']),
        message: (json['message'] as List?)?.map((e) => e.toString()).toList(),
      );

  ResultEntity toEntity() => ResultEntity(
        success: success,
        data: dataModel?.toEntity(),
        message: message,
      );
  @override
  List<Object?> get props => [
        success,
        dataModel,
        message,
      ];
}
