import 'error_response.dart';

class BaseException implements Exception {
  final String message;

  BaseException({this.message = ''});
}

class ServerException extends BaseException {
  final int statusCode;
  final int code;
  final ErrorResponse errorResponse;

  ServerException({
    this.statusCode = -1,
    this.code = -1,
    super.message,
    this.errorResponse = const ErrorResponse(),
  });
}

class NetworkException extends BaseException {
  NetworkException({super.message});
}

class CommonException extends BaseException {
  final Object? error;
  final StackTrace? trace;

  CommonException({
    super.message,
    this.error,
    this.trace,
  });
}

abstract class BaseExceptionHandler {
  BaseException handle(any);
  BaseException handleLoginMessage(any);
  BaseException handleChangeCodeMessage(any);
  BaseException handleProfileMessage(any);
  BaseException handleServiceSettingMessage(any);
  BaseException handleTipBookingSettingMessage(any);
  BaseException handlePartnerMessage(any);
  BaseException handlePaymentMessage(any);
  BaseException handleNewBankMessage(any);
  BaseException handleProfileBankMessage(any);
  BaseException handleOnlineStatusMessage(any);
  BaseException handleBookingStatisticMessage(any);
  BaseException handleFeedbackMessage(any);
  BaseException handleFloorMessage(any);
}
