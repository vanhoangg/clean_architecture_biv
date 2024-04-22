import 'package:flutter/material.dart';

const Color customColor50 = Color(0xfffcd5ce);
const Color customColor100 = Color(0xfffaac9d);
const Color customColor300 = Color(0xfff8836c);
const Color customColor400 = Color(0xfff65a3b);

const Color customColor900 = Color(0xfff4310a);
const Color customColor600 = Color(0xffc32708);

const Color customErrorRed = Color(0xFFC5032B);

const Color customSurfaceWhite = Color(0xFFFFFBFA);
const Color customBackgroundWhite = Colors.white;

class DColorSheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    primary: customColor50,
    primaryContainer: customColor600,
    secondary: Colors.amber,
    secondaryContainer: customColor400,
    surface: Color.fromRGBO(224, 64, 251, 1),
    background: customSurfaceWhite,
    error: customColor900,
    onPrimary: Colors.red,
    onSecondary: Colors.deepOrange,
    onSurface: customColor300,
    onBackground: customColor100,
    onError: Colors.redAccent,
    brightness: Brightness.light,
  );
  static const ColorScheme darkColorScheme = ColorScheme(
    primary: customColor900,
    primaryContainer: customColor600,
    secondary: Colors.amber,
    secondaryContainer: customColor400,
    surface: Color.fromRGBO(112, 32, 125, 1),
    background: Color.fromRGBO(55, 55, 55, 1),
    error: customErrorRed,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.black,
    brightness: Brightness.dark,
  );
}
