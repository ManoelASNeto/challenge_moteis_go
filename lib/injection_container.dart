//import 'dart:io';

import 'package:challenge_moteis_go/core/api/http_client.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //sl.registerSingleton(Http());
  sl.registerSingleton<HttpClient>(HttpClientImpl());

  await sl.allReady();
}
