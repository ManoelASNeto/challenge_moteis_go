part of 'gonow_cubit.dart';

abstract class GonowState extends Equatable {
  const GonowState();

  @override
  List<Object> get props => [];
}

class GonowInitial extends GonowState {}

class GonowLoading extends GonowState {}

class GonowLoaded extends GonowState {
  final ResultEntity resultEntity;
  const GonowLoaded({
    required this.resultEntity,
  });
}

class GonowError extends GonowState {
  final String? msgError;
  const GonowError({
    this.msgError,
  });
}
