import 'category_itens_entity.dart';
import 'itens_entity.dart';
import 'periods_entity.dart';
import 'package:equatable/equatable.dart';

class SuitesEntity extends Equatable {
  final String? name;
  final int? quantity;
  final bool? showAvailableQuantity;
  final List<String>? photos;
  final List<ItensEntity>? itens;
  final List<CategoryItensEntity>? categoryItens;
  final List<PeriodsEntity>? periods;

  const SuitesEntity({
    this.name,
    this.quantity,
    this.showAvailableQuantity,
    this.photos,
    this.itens,
    this.categoryItens,
    this.periods,
  });

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
