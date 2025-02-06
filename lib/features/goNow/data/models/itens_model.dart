import 'package:challenge_moteis_go/features/goNow/domain/entities/itens_entity.dart';
import 'package:equatable/equatable.dart';

class ItensModel extends Equatable {
  final String? name;
  const ItensModel({
    this.name,
  });

  factory ItensModel.fromJson(Map<String, dynamic> json) => ItensModel(
        name: json['nome'] ?? 'Sem nome',
      );

  ItensEntity toEntity() => ItensEntity(
        name: name,
      );
  @override
  List<Object?> get props => [
        name,
      ];
}
