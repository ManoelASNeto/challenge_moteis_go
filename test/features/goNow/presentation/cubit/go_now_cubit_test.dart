import 'package:challenge_moteis_go/features/goNow/domain/usecases/gonow_usecase.dart';
import 'package:challenge_moteis_go/features/goNow/presentation/cubit/gonow_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/result_mock.dart';

class MockGoNowUsecase extends Mock implements GonowUsecase {}

void main() {
  late GonowCubit cubit;
  late MockGoNowUsecase usecase;

  setUp(() {
    usecase = MockGoNowUsecase();
    cubit = GonowCubit(usecase);
  });

  blocTest<GonowCubit, GonowState>(
    'emits  states [GonowLoading, GoNowLoaded] when usecase is called.',
    build: () {
      when(() => usecase.call()).thenAnswer((_) async => motelResulEntity);
      return cubit;
    },
    act: (cubit) => cubit.getGoNow(),
    expect: () => [
      GonowLoading(),
      GonowLoaded(resultEntity: motelResulEntity),
    ],
  );
}
