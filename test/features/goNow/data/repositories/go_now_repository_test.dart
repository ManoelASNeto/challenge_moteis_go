import 'package:challenge_moteis_go/features/goNow/data/datasources/gonow_remote_datasource.dart';
import 'package:challenge_moteis_go/features/goNow/data/repositories/gonow_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/result_mock.dart';

class MockGoNowRemoteDatasource extends Mock implements GonowRemoteDatasourceImpl {}

void main() {
  late GonowRepositoryImpl repositoryImpl;
  late MockGoNowRemoteDatasource mockRemoteDatasource;

  setUp(() {
    mockRemoteDatasource = MockGoNowRemoteDatasource();
    repositoryImpl = GonowRepositoryImpl(remoteDatasource: mockRemoteDatasource);
  });

  test('should show return the loaded entity', () async {
    when(() => mockRemoteDatasource.getGoNow()).thenAnswer((_) async => resultMock);

    final response = await repositoryImpl.getGoNowResult();

    expect(response, motelResulEntity);
  });
}
