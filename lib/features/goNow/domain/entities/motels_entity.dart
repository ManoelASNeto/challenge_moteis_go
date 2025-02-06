import 'package:equatable/equatable.dart';

import 'suites_entity.dart';

class MotelsEntity extends Equatable {
  final String? fantasy;
  final String? logo;
  final String? neighborhood;
  final double? distance;
  final int? quantityFavorites;
  final List<SuitesEntity>? suites;
  final int? quantityReviews;
  final double? media;

  const MotelsEntity({
    this.fantasy,
    this.logo,
    this.neighborhood,
    this.distance,
    this.quantityFavorites,
    this.suites,
    this.quantityReviews,
    this.media,
  });

  @override
  List<Object?> get props => [
        fantasy,
        logo,
        neighborhood,
        distance,
        quantityFavorites,
        suites,
        quantityReviews,
        media,
      ];
}
