import 'dart:async';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'di/di.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}
