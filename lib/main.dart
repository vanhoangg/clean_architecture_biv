import 'package:flutter/material.dart';
import 'package:test_gpt_application/util/theme/app_theme.dart';

import 'definition/strings.dart';
import 'route/route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      // onGenerateRoute: (settings) => di<AppRoute>().generateRoute(settings),
      debugShowCheckedModeBanner: false,
      initialRoute: ScreenName.root,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
