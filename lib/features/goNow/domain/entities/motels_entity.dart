import 'package:equatable/equatable.dart';

import 'suites_entity.dart';

class MotelsEntity extends Equatable {
  final String? nameFantasy;
  final String? logo;
  final String? neighborhood;
  final double? distance;
  final int? quantityFavorites;
  final List<SuitesEntity>? suites;
  final int? quantityReviews;
  final double? media;

  const MotelsEntity({
    this.nameFantasy,
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
        nameFantasy,
        logo,
        neighborhood,
        distance,
        quantityFavorites,
        suites,
        quantityReviews,
        media,
      ];
}
