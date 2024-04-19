import '../../../../shared/shared.dart';
import '../base_bloc_event.dart';

sealed class CommonEvent extends BaseBlocEvent {
  const CommonEvent();
}

class ExceptionEmitted extends CommonEvent {
  final AppExceptionWrapper appExceptionWrapper;

  const ExceptionEmitted({
    required this.appExceptionWrapper,
  });
}

class LoadingVisibilityEmitted extends CommonEvent {
  final bool isLoading;

  const LoadingVisibilityEmitted({
    required this.isLoading,
  });
}

class ForceLogoutButtonPressed extends CommonEvent {
  const ForceLogoutButtonPressed();
}
