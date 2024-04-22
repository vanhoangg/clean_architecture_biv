class ResultResponse<T> {
  final String? code;
  final String? message;
  final T? result;

  ResultResponse({
    this.result,
    this.code,
    this.message,
  });

  factory ResultResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return ResultResponse(
      result: fromJsonT(json['result']),
      code: json['code'],
      message: json['message'],
    );
  }
}

class ResultsListResponse<T> {
  final List<T>? results;
  final String? code;
  final String? message;
  ResultsListResponse({
    this.results,
    this.code,
    this.message,
  });

  factory ResultsListResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return ResultsListResponse(
      results:
          (json['results'] as List).map((item) => fromJsonT(item)).toList(),
      code: json['code'],
      message: json['message'],
    );
  }
}
