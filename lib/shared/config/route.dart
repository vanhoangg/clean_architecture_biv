import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final NavigatorState navigatorState = navigatorKey.currentState!;

class AppRoute {
  PageRoute generateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;

    switch (name) {}

    return _materialPage(Container(), settings);
  }

  MaterialPageRoute _materialPage(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  // PageRoute _noAnimationRoute(Widget page, RouteSettings settings) {
  //   return CustomPageRouteBuilder(
  //       pageBuilder: (BuildContext context, Animation<double> animation,
  //               Animation<double> secondaryAnimation) =>
  //           page,
  //       transitionDuration: Duration.zero,
  //       reverseTransitionDuration: Duration.zero);
  // }
}
