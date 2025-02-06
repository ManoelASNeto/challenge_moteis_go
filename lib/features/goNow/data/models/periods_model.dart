import 'package:challenge_moteis_go/features/goNow/domain/entities/periods_entity.dart';
import 'package:equatable/equatable.dart';

class PeriodsModel extends Equatable {
  final String? formattedTime;
  final String? time;
  final double? price;
  final double? totalPrice;
  final bool? courtesy;
  const PeriodsModel({
    this.formattedTime,
    this.time,
    this.price,
    this.totalPrice,
    this.courtesy,
  });

  factory PeriodsModel.fromJson(Map<String, dynamic> json) => PeriodsModel(
        formattedTime: json['tempoFormatado'] ?? '',
        time: json['tempo'] ?? '',
        price: json['valor'] ?? '',
        totalPrice: json['valorTotal'] ?? '',
        courtesy: json['temCortesia'] ?? false,
      );

  PeriodsEntity toEntity() => PeriodsEntity(
        formattedTime: formattedTime,
        time: time,
        price: price,
        totalPrice: totalPrice,
        courtesy: courtesy,
      );
  @override
  List<Object?> get props => [
        formattedTime,
        time,
        price,
        totalPrice,
        courtesy,
      ];
}
