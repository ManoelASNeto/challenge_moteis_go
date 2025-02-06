import 'package:equatable/equatable.dart';

import 'motels_entity.dart';

class DataEntity extends Equatable {
  final int? page;
  final int? quantityPerPage;
  final int? totalSuites;
  final int? totalMotels;
  final int? ray;
  final int? maxPages;
  final List<MotelsEntity>? motels;

  const DataEntity({
    this.page,
    this.quantityPerPage,
    this.totalSuites,
    this.totalMotels,
    this.ray,
    this.maxPages,
    this.motels,
  });

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
