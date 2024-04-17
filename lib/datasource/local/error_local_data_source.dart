import 'dart:convert';

import 'package:flutter/services.dart';

import '../../util/check_null_util.dart';

abstract class ErrorLocalDataSource {
  Future<String?> getMessageError(int? code);
}

class ErrorLocalDataSourceImplement implements ErrorLocalDataSource {
  ErrorLocalDataSourceImplement();

  @override
  Future<String?> getMessageError(int? code) async {
    final String response =
        await rootBundle.loadString('assets/error/api_error_message.json');
    final data = await json.decode(response);

    if (isNull(code)) return data['code_unknown']?['vi'];
    return data['code_$code']?['vi'] ?? data['code_unknown']?['vi'];
  }
}
