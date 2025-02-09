import 'package:challenge_moteis_go/features/goNow/presentation/cubit/gonow_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/router.dart';
import 'core/routes/routes.dart';
import 'features/goNow/presentation/pages/home_page.dart';
import 'injection_container.dart' as sl;
import 'package:flutter/material.dart';

void main() async {
  await sl.init();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  final _router = AppRouter();

  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl.sl<GonowCubit>();
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[150]),
      onGenerateRoute: _router.generateRoutes,
      initialRoute: Routes.homePage,
      home: BlocProvider(
        create: (context) => cubit,
        child: HomePage(),
      ),
    );
  }
}
