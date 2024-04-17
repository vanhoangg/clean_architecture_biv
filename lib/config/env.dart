enum ENVType {
  uat,
  beta;

  bool get isDev => this == ENVType.uat;

  bool get isBeta => this == ENVType.beta;

  Env toENV() {
    switch (this) {
      case uat:
        return UatEnv();
      case beta:
        return BetaEnv();
      default:
        return BetaEnv();
    }
  }
}

abstract class Env {
  String get baseUrl;
}

class UatEnv implements Env {
  @override
  String get baseUrl => 'https://main.mobex.lat/';
}

class BetaEnv implements Env {
  @override
  String get baseUrl => 'https://lol.com';
}
