import 'package:flutter/material.dart';

import 'text_theme.dart';

class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTextTheme,
    fontFamily: 'Quicksand',
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFFF55050),
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: AppTextTheme.darkTextTheme,
    fontFamily: 'Quicksand',
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFFF55050),
  );
}
