import 'package:bloc/bloc.dart';
import 'package:challenge_moteis_go/features/goNow/domain/usecases/gonow_usecase.dart';
import '../../domain/entities/result_entity.dart';
import 'package:equatable/equatable.dart';

part 'gonow_state.dart';

class GonowCubit extends Cubit<GonowState> {
  final GonowUsecase usecase;
  GonowCubit(this.usecase) : super(GonowInitial());

  Future<void> getGoNow() async {
    emit(GonowLoading());
    final response = await usecase.call();
    emit(
      GonowLoaded(
        resultEntity: response,
      ),
    );
  }
}
