class RecordResponse<T> {
  final T? record;
  final String? code;
  final String? message;

  RecordResponse({
    this.record,
    this.code,
    this.message,
  });

  factory RecordResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return RecordResponse(
      record: fromJsonT(json['record']),
      code: json['code'],
      message: json['message'],
    );
  }
}

class RecordsListResponse<T> {
  final List<T>? records;
  final String? code;
  final String? message;

  RecordsListResponse({
    this.records,
    this.code,
    this.message,
  });

  factory RecordsListResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return RecordsListResponse(
      records:
          (json['records'] as List).map((item) => fromJsonT(item)).toList(),
      code: json['code'],
      message: json['message'],
    );
  }
}
