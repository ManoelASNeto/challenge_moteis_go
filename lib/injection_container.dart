import 'package:challenge_moteis_go/core/dio/dio_client.dart';
import 'package:challenge_moteis_go/features/goNow/data/datasources/gonow_remote_datasource.dart';
import 'package:challenge_moteis_go/features/goNow/data/repositories/gonow_repository_impl.dart';
import 'package:challenge_moteis_go/features/goNow/domain/repositories/gonow_repository.dart';
import 'package:challenge_moteis_go/features/goNow/domain/usecases/gonow_usecase.dart';
import 'package:challenge_moteis_go/features/goNow/presentation/cubit/gonow_cubit.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //sl.registerLazySingleton(() => http.Client());
  //sl.registerLazySingleton<HttpClient>(() => HttpClientImpl());

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<DioClient>(() => DioClientImpl());

  sl.registerLazySingleton<GonowRemoteDatasource>(
    () => GonowRemoteDatasourceImpl(
      dioClient: sl(),
    ),
  );

  sl.registerLazySingleton<GonowRepository>(
    () => GonowRepositoryImpl(
      remoteDatasource: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GonowUsecase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GonowCubit(
      sl(),
    ),
  );

  await sl.allReady();
}
