import 'package:equatable/equatable.dart';

import '../../domain/entities/suites_entity.dart';
import 'category_itens_model.dart';
import 'itens_model.dart';
import 'periods_model.dart';

class SuitesModel extends Equatable {
  final String? name;
  final int? quantity;
  final bool? showAvailableQuantity;
  final List<String>? photos;
  final List<ItensModel>? itens;
  final List<CategoryItensModel>? categoryItens;
  final List<PeriodsModel>? periods;

  const SuitesModel({
    this.name,
    this.quantity,
    this.showAvailableQuantity,
    this.photos,
    this.itens,
    this.categoryItens,
    this.periods,
  });

  factory SuitesModel.fromJson(Map<String, dynamic> json) => SuitesModel(
        name: json['nome'] ?? 'Sem nome',
        quantity: json['qtd'] ?? 0,
        showAvailableQuantity: json['exibirQtdDisponiveis'] ?? false,
        photos: (json['fotos'] as List?)?.map((e) => e.toString()).toList(),
        itens: (json['itens'] as List?)?.map((e) => ItensModel.fromJson(e)).toList(),
        categoryItens: (json['categoriaItens'] as List?)?.map((e) => CategoryItensModel.fromJson(e)).toList(),
        periods: (json['periodos'] as List?)?.map((e) => PeriodsModel.fromJson(e)).toList(),
      );

  SuitesEntity toEntity() => SuitesEntity(
        name: name,
        quantity: quantity,
        showAvailableQuantity: showAvailableQuantity,
        photos: photos,
        itens: itens?.map((item) => item.toEntity()).toList(),
        categoryItens: categoryItens?.map((categoria) => categoria.toEntity()).toList(),
        periods: periods?.map((periodo) => periodo.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [
        name,
        quantity,
        showAvailableQuantity,
        photos,
        itens,
        categoryItens,
        periods,
      ];
}
