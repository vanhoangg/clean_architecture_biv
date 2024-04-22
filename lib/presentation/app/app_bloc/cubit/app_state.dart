part of 'app_cubit.dart';

class AppState with EquatableMixin {
  // final LanguageCode languageCode;
  final bool? isLoggedIn;
  final bool? isDarkTheme;

  const AppState({
    // this.languageCode,
    this.isLoggedIn,
    this.isDarkTheme,
  }) : super();

  AppState copyWith({
    // // LanguageCode? languageCode,
    bool? isLoggedIn,
    bool? isDarkTheme,
  }) {
    return AppState(
      // // languageCode: languageCode ?? this.languageCode,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }

  @override
  List<Object?> get props => [isDarkTheme, isLoggedIn];
}
