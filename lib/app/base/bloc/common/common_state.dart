import 'package:clean_architecture_biv/shared/shared.dart';
import 'package:equatable/equatable.dart';

import '../base_bloc_state.dart';

class CommonState extends BaseBlocState with EquatableMixin {
  final AppExceptionWrapper? appExceptionWrapper;
  final int loadingCount;
  final bool isLoading;

  const CommonState({
    this.appExceptionWrapper,
    this.loadingCount = 0,
    this.isLoading = false,
  }) : super();

  CommonState copyWith({
    AppExceptionWrapper? appExceptionWrapper,
    int? loadingCount,
    bool? isLoading,
  }) {
    return CommonState(
      appExceptionWrapper: appExceptionWrapper ?? this.appExceptionWrapper,
      loadingCount: loadingCount ?? this.loadingCount,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [appExceptionWrapper, loadingCount, isLoading];
}
