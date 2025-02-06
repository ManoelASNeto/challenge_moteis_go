import 'package:equatable/equatable.dart';

import 'motels_entity.dart';

class DataEntity extends Equatable {
  final int? page;
  final int? quantityPerPage;
  final int? totalSuites;
  final int? totalMotels;
  final int? radius;
  final int? maxPages;
  final List<MotelsEntity>? motels;

  const DataEntity({
    this.page,
    this.quantityPerPage,
    this.totalSuites,
    this.totalMotels,
    this.radius,
    this.maxPages,
    this.motels,
  });

  @override
  List<Object?> get props => [
        page,
        quantityPerPage,
        totalSuites,
        totalMotels,
        radius,
        maxPages,
        motels,
      ];
}
