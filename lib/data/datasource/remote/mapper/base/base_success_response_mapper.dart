import 'package:clean_architecture_biv/shared/model/typedef.dart';

import '../../../../../shared/exception/remote/remote_exception.dart';
import 'base_success_response_mapper/data_json_array_response_mapper.dart';
import 'base_success_response_mapper/data_json_object_reponse_mapper.dart';
import 'base_success_response_mapper/json_array_response_mapper.dart';
import 'base_success_response_mapper/json_object_reponse_mapper.dart';
import 'base_success_response_mapper/plain_response_mapper.dart';
import 'base_success_response_mapper/records_json_array_response_mapper.dart';
import 'base_success_response_mapper/results_json_array_response_mapper.dart';

enum SuccessResponseMapperType {
  dataJsonObject,
  dataJsonArray,
  jsonObject,
  jsonArray,
  recordsJsonArray,
  resultsJsonArray,
  plain,
}

abstract class BaseSuccessResponseMapper<I extends Object, O extends Object> {
  const BaseSuccessResponseMapper();

  factory BaseSuccessResponseMapper.fromType(SuccessResponseMapperType type) {
    return switch (type) {
      SuccessResponseMapperType.dataJsonObject =>
        DataJsonObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
      SuccessResponseMapperType.dataJsonArray =>
        DataJsonArrayResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
      SuccessResponseMapperType.jsonObject =>
        JsonObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
      SuccessResponseMapperType.jsonArray =>
        JsonArrayResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
      SuccessResponseMapperType.recordsJsonArray =>
        RecordsJsonArrayResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
      SuccessResponseMapperType.resultsJsonArray =>
        ResultsJsonArrayResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
      SuccessResponseMapperType.plain =>
        PlainResponseMapper<I>() as BaseSuccessResponseMapper<I, O>,
    };
  }

  // ignore: avoid-dynamic
  O? map({
    required dynamic response,
    Decoder<I>? decoder,
  }) {
    assert(response != null);
    try {
      return mapToDataModel(response: response, decoder: decoder);
    } on RemoteException catch (_) {
      rethrow;
    } catch (e) {
      throw RemoteException(
          kind: RemoteExceptionKind.decodeError, rootException: e);
    }
  }

  // ignore: avoid-dynamic
  O? mapToDataModel({
    required dynamic response,
    Decoder<I>? decoder,
  });
}
