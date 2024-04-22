class ErrorResponse {
  final dynamic error;
  final int? code;
  final dynamic message;

  const ErrorResponse({this.error, this.code, this.message});
}
