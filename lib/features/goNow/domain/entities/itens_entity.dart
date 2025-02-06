import 'package:equatable/equatable.dart';

class ItensEntity extends Equatable {
  final String? name;

  const ItensEntity({
    this.name,
  });

  @override
  List<Object?> get props => [name];
}
