import 'package:clean_architecture_biv/shared/shared.dart';
import 'package:flutter/material.dart';

import 'text_theme.dart';

class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
      textTheme: AppTextTheme.lightTextTheme,
      fontFamily: 'Quicksand',
      useMaterial3: true,
      colorScheme: DColorSheme.lightColorScheme,
      primaryTextTheme: AppTextTheme.lightTextTheme);

  // Dark theme
  static ThemeData darkTheme = ThemeData(
      textTheme: AppTextTheme.darkTextTheme,
      fontFamily: 'Quicksand',
      useMaterial3: true,
      colorScheme: DColorSheme.darkColorScheme,
      primaryTextTheme: AppTextTheme.darkTextTheme);
}
