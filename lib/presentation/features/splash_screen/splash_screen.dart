import 'package:clean_architecture_biv/presentation/features/base/base_stateful_widget.dart';
import 'package:clean_architecture_biv/shared/util/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
            duration: const Duration(seconds: 2),
            color: Colors.blue,
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'DIDPO OL',
                      style:
                          AppTheme.of(context).themeData.textTheme.bodyLarge),
                  TextSpan(
                      text: 'FIT',
                      style:
                          AppTheme.of(context).themeData.textTheme.bodyLarge),
                ]))
              ],
            ))));
  }
}
