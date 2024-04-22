import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../shared/util/function/check_null_util.dart';
// ErrorLocalDataSource

/// An abstract class that defines the contract for an error local data source.
///
/// This class declares a method to get a message error based on a provided error code.
abstract class ErrorLocalDataSource {
  /// Retrieves the error message corresponding to the provided [code].
  ///
  /// If the [code] is null or if there's no message for the provided [code],
  /// it returns the message for an unknown error code.
  ///
  /// Returns a [Future] that completes with the error message or `null` if no message is found.
  Future<String?> getMessageError(int? code);
}

/// A class that implements the [ErrorLocalDataSource] contract.
///
/// This class reads a JSON file that contains error messages and retrieves the message
/// corresponding to a provided error code.
class ErrorLocalDataSourceImplement implements ErrorLocalDataSource {
  /// Creates an instance of [ErrorLocalDataSourceImplement].
  ErrorLocalDataSourceImplement();

  @override

  /// Retrieves the error message corresponding to the provided [code] from a JSON file.
  ///
  /// If the [code] is null or if there's no message for the provided [code] in the JSON file,
  /// it returns the message for an unknown error code.
  ///
  /// Returns a [Future] that completes with the error message or `null` if no message is found.
  Future<String?> getMessageError(int? code) async {
    final String response =
        await rootBundle.loadString('assets/error/api_error_message.json');
    final data = await json.decode(response);

    if (isNull(code)) return data['code_unknown']?['vi'];
    return data['code_$code']?['vi'] ?? data['code_unknown']?['vi'];
  }
}
