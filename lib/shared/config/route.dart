import 'package:clean_architecture_biv/presentation/features/home_screen/home_screen.dart';
import 'package:clean_architecture_biv/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/features/splash_screen/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final NavigatorState navigatorState = navigatorKey.currentState!;

class AppRoute {
  GoRouter generateRoute() => GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: ScreenName.root,
            builder: (BuildContext context, GoRouterState state) {
              return const SplashScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                path: ScreenName.home,
                builder: (BuildContext context, GoRouterState state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),
        ],
      );

  // PageRoute _noAnimationRoute(Widget page, RouteSettings settings) {
  //   return CustomPageRouteBuilder(
  //       pageBuilder: (BuildContext context, Animation<double> animation,
  //               Animation<double> secondaryAnimation) =>
  //           page,
  //       transitionDuration: Duration.zero,
  //       reverseTransitionDuration: Duration.zero);
  // }
}
