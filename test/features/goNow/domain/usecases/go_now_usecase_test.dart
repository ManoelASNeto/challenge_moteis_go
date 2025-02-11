import 'package:challenge_moteis_go/features/goNow/domain/repositories/gonow_repository.dart';
import 'package:challenge_moteis_go/features/goNow/domain/usecases/gonow_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/result_mock.dart';

class MockGoNowRepository extends Mock implements GonowRepository {}

void main() {
  late GonowUsecase usecase;
  late MockGoNowRepository repository;

  setUp(() {
    repository = MockGoNowRepository();
    usecase = GonowUsecase(repository: repository);
  });

  test('Should get the entity loaded when it comes from the repository', () async {
    when(() => repository.getGoNowResult()).thenAnswer((_) async => resultMock.toEntity());

    final response = await usecase.call();

    expect(response, resultMock.toEntity());
  });
}
