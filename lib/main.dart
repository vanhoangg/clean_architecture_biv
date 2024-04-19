import 'dart:async';
import 'package:flutter/material.dart';
import 'app.dart';
import 'di/di.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const App());
}
