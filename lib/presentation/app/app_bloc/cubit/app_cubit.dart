import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void changeAppTheme() {
    emit(state.copyWith(isDarkTheme: !(state.isDarkTheme ?? false)));
  }
}
