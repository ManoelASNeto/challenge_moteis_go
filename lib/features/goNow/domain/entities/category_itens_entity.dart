import 'package:equatable/equatable.dart';

class CategoryItensEntity extends Equatable {
  final String? name;
  final String? icon;

  const CategoryItensEntity({
    this.name,
    this.icon,
  });
  @override
  List<Object?> get props => [
        name,
        icon,
      ];
}
