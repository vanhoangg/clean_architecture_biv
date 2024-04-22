import 'package:clean_architecture_biv/shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../../flavors.dart';
import '../features/my_home_page.dart';
import 'app_bloc/cubit/app_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppCubit _appCubit = di();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _appCubit,
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          Log.d(state.toString());
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            title: F.title,
            themeMode: ThemeMode.system,
            theme: (state.isDarkTheme ?? false)
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
            home: _flavorBanner(
              child: const MyHomePage(),
              show: kDebugMode,
            ),
          );
        },
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
