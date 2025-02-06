import 'package:equatable/equatable.dart';

class PeriodsEntity extends Equatable {
  final String? formattedTime;
  final String? time;
  final double? price;
  final double? totalPrice;
  final bool? courtesy;
  const PeriodsEntity({
    this.formattedTime,
    this.time,
    this.price,
    this.totalPrice,
    this.courtesy,
  });
  @override
  List<Object?> get props => [
        formattedTime,
        time,
        price,
        totalPrice,
        courtesy,
      ];
}
