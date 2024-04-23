import 'package:clean_architecture_biv/shared/shared.dart';

import 'package:flutter/material.dart';

abstract class AppThemeData {
  LinearGradient get purpleLinear;
  LinearGradient get logoLinear;
  Brightness get brightness;
  ColorScheme get color;
  TextTheme get textTheme;
  // Color? get canvasColor;
  // Color? get cardColor;
  // ColorScheme? get colorScheme;
  // Color? get colorSchemeSeed;
  // Color? get dialogBackgroundColor;
  // Color? get disabledColor;
  // Color? get dividerColor;
  // Color? get focusColor;
  // Color? get highlightColor;
  // Color? get hintColor;
  // Color? get hoverColor;
  // Color? get indicatorColor;
  // Color? get primaryColor;
  // Color? get primaryColorDark;
  // Color? get primaryColorLight;
  // MaterialColor? get primarySwatch;
  // Color? get scaffoldBackgroundColor;
  // Color? get secondaryHeaderColor;
  // Color? get shadowColor;
  // Color? get splashColor;
  // Color? get unselectedWidgetColor;
}

class AppThemeLight extends AppThemeData {
  // Light theme

  @override
  Brightness get brightness => Brightness.light;
  @override
  LinearGradient get purpleLinear => const LinearGradient(
      begin: Alignment(-1.00, 0.01),
      end: Alignment(1, -0.01),
      colors: [Color(0xFF9C23D7), Color(0xFF9D27AC), Color(0xff9F2E6E)]);
  @override
  LinearGradient get logoLinear => const LinearGradient(
        begin: Alignment(-1.00, 0.01),
        end: Alignment(1, -0.01),
        colors: [Color(0xFF983BCB), Color(0xFF4023D7)],
      );
  @override
  ColorScheme get color => DColorSheme.lightColorScheme;

  @override
  TextTheme get textTheme => AppTextTheme.lightTextTheme;
}

class AppThemeDark extends AppThemeData {
  @override
  Brightness get brightness => Brightness.dark;
  @override
  LinearGradient get purpleLinear => const LinearGradient(
        begin: Alignment(-1.00, 0.01),
        end: Alignment(1, -0.01),
        colors: [Color(0xFFC150F6), Color(0xFFEEA4CE)],
      );
  @override
  LinearGradient get logoLinear => const LinearGradient(
        begin: Alignment(-1.00, 0.01),
        end: Alignment(1, -0.01),
        colors: [Color(0xFF9C22D6), Color(0xFF9F2E6E)],
      );
  @override
  ColorScheme get color => DColorSheme.darkColorScheme;

  @override
  TextTheme get textTheme => AppTextTheme.darkTextTheme;
}

// ignore: must_be_immutable
class AppTheme extends InheritedWidget {
  AppTheme({required super.child, super.key});

  AppThemeData _themeData = AppThemeLight();
  bool _isLightTheme = true;
  bool get isLightTheme => _isLightTheme;
  AppThemeData get themeData => _themeData;
  ThemeData get theme => ThemeData(
      brightness: _themeData.brightness,
      textTheme: _themeData.textTheme,
      fontFamily: 'Quicksand',
      useMaterial3: true,
      colorScheme: _themeData.color,
      primaryTextTheme: _themeData.textTheme);

  final AppThemeData darkThemeData = AppThemeDark();
  final AppThemeData lightThemeData = AppThemeLight();

  void changeToDarkTheme() {
    _themeData = darkThemeData;
    _isLightTheme = false;
  }

  void changeToLightTheme() {
    _themeData = lightThemeData;
    _isLightTheme = true;
  }

  void toggleTheme() {
    isLightTheme ? changeToDarkTheme() : changeToLightTheme();
  }

  /// About `covariant` keyword:
  ///     Valid reason to use a [AppTheme] subtype instead [InheritedWidget]
  ///
  /// See: https://dart.dev/guides/language/sound-problems
  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) =>
      oldWidget.isLightTheme != isLightTheme;

  static AppTheme of(BuildContext context) {
    final AppTheme? result =
        context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No DSTheme found in context');
    return result!;
  }
}
