import '../../features/goNow/presentation/pages/home_page.dart';
import '../../features/goNow/presentation/pages/more_photos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';
import '../../features/goNow/presentation/cubit/gonow_cubit.dart';
import '../../injection_container.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoutes(RouteSettings settings) {
    final gonowCubit = sl<GonowCubit>();

    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: gonowCubit..getGoNow(),
            child: const HomePage(),
          ),
        );
      case Routes.morePhotos:
        return MaterialPageRoute(builder: (context) => MorePhotos(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Página não encontrada"),
            ),
          ),
        );
    }
  }
}
