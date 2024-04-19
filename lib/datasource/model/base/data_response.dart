class DataResponse<T> {
  final T? data;
  final String? code;
  final String? message;

  DataResponse({
    this.data,
    this.code,
    this.message,
  });

  factory DataResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return DataResponse(
      data: fromJsonT(json['data']),
      code: json['code'],
      message: json['message'],
    );
  }
}

class DataListResponse<T> {
  final List<T>? data;
  final String? code;
  final String? message;

  DataListResponse({
    this.data,
    this.code,
    this.message,
  });

  factory DataListResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return DataListResponse(
      data: (json['data'] as List).map((item) => fromJsonT(item)).toList(),
      code: json['code'],
      message: json['message'],
    );
  }
}
