abstract class ScreenName {
  static const String root = '/';
  static const String home = 'home';
}

abstract class AppStrings {
  static const String authRoute = '/auth';
  static const String loginEndpoint = "$authRoute/login";
  static const String getDetailEndpoint = "$authRoute/me";
}
