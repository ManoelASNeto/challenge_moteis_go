import 'package:challenge_moteis_go/core/http_client/http_client.dart';
import 'package:challenge_moteis_go/features/goNow/data/datasources/gonow_remote_datasource.dart';
import 'package:challenge_moteis_go/features/goNow/data/models/data_model.dart';
import 'package:challenge_moteis_go/features/goNow/data/models/result_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/result_mock.dart';

class HttpMock extends Mock implements HttpClient {}

void main() {
  late GonowRemoteDatasourceImpl remoteDatasourceImpl;
  late HttpMock httpMock;

  setUp(() {
    httpMock = HttpMock();
    remoteDatasourceImpl = GonowRemoteDatasourceImpl(client: httpMock);
  });

  test('Should show endpoints correctly', () async {
    when(() => httpMock.get(endpoint: any(named: 'endpoint'))).thenAnswer((_) async => motelResponseFromJson);

    final response = await remoteDatasourceImpl.getGoNow();

    expect(
      response,
      ResultModel.fromJson(motelResponseFromJson),
    );
    expect(response, isA<ResultModel>());
    expect(response.dataModel, isA<DataModel>());
  });
}
