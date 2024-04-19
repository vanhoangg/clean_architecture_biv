import 'package:clean_architecture_biv/shared/model/typedef.dart';

import '../base_success_response_mapper.dart';

class JsonArrayResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, List<T>> {
  @override
  // ignore: avoid-dynamic
  List<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is List
        ? response
            .map((jsonObject) => decoder(jsonObject as Map<String, dynamic>))
            .toList(growable: false)
        : null;
  }
}
