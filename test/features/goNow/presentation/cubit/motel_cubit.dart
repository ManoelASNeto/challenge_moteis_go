import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'motel_state.dart';

class MotelCubit extends Cubit<MotelState> {
  MotelCubit() : super(MotelInitial());
}
