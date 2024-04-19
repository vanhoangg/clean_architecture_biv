import 'package:clean_architecture_biv/app/base/base_page_state.dart';
import 'package:clean_architecture_biv/shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../flavors.dart';
import '../pages/my_home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends BasePageState<App> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        Log.d(state.toString());
        return MaterialApp(
          title: F.title,
          themeMode: ThemeMode.system,
          theme:
              state is AppThemeChanged ? state.appTheme : AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: _flavorBanner(
            child: const MyHomePage(),
            show: kDebugMode,
          ),
        );
      },
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
