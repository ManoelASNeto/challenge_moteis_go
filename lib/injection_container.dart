import 'package:challenge_moteis_go/core/http_client/http_client.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<HttpClient>(() => HttpClientImpl());

  await sl.allReady();
}
