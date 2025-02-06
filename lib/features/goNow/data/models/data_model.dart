import 'package:equatable/equatable.dart';

import '../../domain/entities/data_entity.dart';
import 'motels_model.dart';

class DataModel extends Equatable {
  final int? page;
  final int? quantityPerPage;
  final int? totalSuites;
  final int? totalMotels;
  final int? ray;
  final int? maxPages;
  final List<MotelsModel>? motels;

  const DataModel({
    this.page,
    this.quantityPerPage,
    this.totalSuites,
    this.totalMotels,
    this.ray,
    this.maxPages,
    this.motels,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        page: json['pagina'] ?? 0,
        quantityPerPage: json['qtdPorPagina'] ?? 0,
        totalSuites: json['totalSuites'] ?? 0,
        totalMotels: json['totalMoteis'] ?? 0,
        ray: json['raio'] ?? 0,
        maxPages: json['maxPaginas'] ?? 0,
        motels: (json['moteis'] as List?)?.map((e) => MotelsModel.fromJson(e)).toList(),
      );

  DataEntity toEntity() => DataEntity(
        page: page,
        quantityPerPage: quantityPerPage,
        totalSuites: totalSuites,
        totalMotels: totalMotels,
        ray: ray,
        maxPages: maxPages,
        motels: motels?.map((motel) => motel.toEntity()).toList(),
      );
  @override
  List<Object?> get props => [
        page,
        quantityPerPage,
        totalSuites,
        totalMotels,
        ray,
        maxPages,
        motels,
      ];
}
