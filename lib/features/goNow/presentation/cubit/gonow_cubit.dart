import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gonow_state.dart';

class GonowCubit extends Cubit<GonowState> {
  GonowCubit() : super(GonowInitial());
}
