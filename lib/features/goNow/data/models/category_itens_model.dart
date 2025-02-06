import 'package:challenge_moteis_go/features/goNow/domain/entities/category_itens_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryItensModel extends Equatable {
  final String? name;
  final String? icon;
  const CategoryItensModel({
    this.name,
    this.icon,
  });

  factory CategoryItensModel.fromJson(Map<String, dynamic> json) => CategoryItensModel(
        name: json['nome'] ?? 'Sem nome',
        icon: json['icone'] ?? 'Sem icone',
      );

  CategoryItensEntity toEntity() => CategoryItensEntity(
        name: name,
        icon: icon,
      );

  @override
  List<Object?> get props => [
        name,
        icon,
      ];
}
