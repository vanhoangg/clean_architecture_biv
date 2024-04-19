import 'package:clean_architecture_biv/app/app_bloc/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import '../di/di.dart';
import '../flavors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AppCubit _appCubit = di();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(F.title),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              _appCubit.changeAppTheme(ThemeData.light());
            },
            child: Text(
              'CLICK ME NOW ${F.title}',
            ),
          ),
        ));
  }
}
