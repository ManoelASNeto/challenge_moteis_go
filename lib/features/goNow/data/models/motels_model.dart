import 'package:equatable/equatable.dart';

import '../../domain/entities/motels_entity.dart';
import 'suites_model.dart';

class MotelsModel extends Equatable {
  final String? fantasy;
  final String? logo;
  final String? neighborhood;
  final double? distance;
  final int? quantityFavorites;
  final List<SuitesModel>? suites;
  final int? quantityReviews;
  final double? media;

  const MotelsModel({
    this.fantasy,
    this.logo,
    this.neighborhood,
    this.distance,
    this.quantityFavorites,
    this.suites,
    this.quantityReviews,
    this.media,
  });

  factory MotelsModel.fromJson(Map<String, dynamic> json) => MotelsModel(
        fantasy: json['fantasia'] ?? 'Sem nome',
        logo: json['logo'] ?? 'sem logo',
        neighborhood: json['bairro'] ?? '',
        distance: json['distancia'] ?? 0.0,
        quantityFavorites: json['qtdFavoritos'] ?? 0,
        suites: (json['suites'] as List?)?.map((e) => SuitesModel.fromJson(e)).toList(),
        quantityReviews: json['qtdAvaliacoes'] ?? 0,
        media: json['media'] ?? 0.0,
      );

  MotelsEntity toEntity() => MotelsEntity(
        fantasy: fantasy,
        logo: logo,
        neighborhood: neighborhood,
        distance: distance,
        quantityFavorites: quantityFavorites,
        suites: suites?.map((suite) => suite.toEntity()).toList(),
        quantityReviews: quantityReviews,
        media: media,
      );

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
