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
  void didChangePlatformBrightness() {
    AppTheme.of(context).toggleTheme();
    super.didChangePlatformBrightness();
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
            themeMode: ThemeMode.system,
            theme: AppTheme.of(context).themeData.theme
            // ThemeData(
            //     brightness: AppTheme.of(context).themeData.brightness,
            //     textTheme: AppTheme.of(context).themeData.textTheme,
            //     fontFamily: 'Quicksand',
            //     useMaterial3: true,
            //     colorScheme: AppTheme.of(context).themeData.color,
            //     primaryTextTheme: AppTheme.of(context).themeData.textTheme),
            );
      }),
    );
  }
}
