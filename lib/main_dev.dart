import 'package:flutter/material.dart';

import 'di/di.dart';
import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await runner.main();
}
