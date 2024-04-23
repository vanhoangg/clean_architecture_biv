import 'package:clean_architecture_biv/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../di/di.dart';
import '../../flavors.dart';
import 'package:clean_architecture_biv/presentation/features/base/base_stateful_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends BaseState<App> with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      Log.d('AppLifecycleState: $state');
      widgetUtil.closeGlobalKeyboard();
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: Builder(builder: (context) {
        return MaterialApp.router(
          routerConfig: di<AppRoute>().generateRoute(),
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          title: F.title,
          the
          theme: ThemeData(
              brightness: AppTheme.of(context).themeData.brightness,
              textTheme: AppTheme.of(context).themeData.textTheme,
              fontFamily: 'Quicksand',
              useMaterial3: true,
              colorScheme: AppTheme.of(context).themeData.color,
              primaryTextTheme: AppTheme.of(context).themeData.textTheme),
        );
      }),
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
