import 'package:clean_architecture_biv/shared/model/typedef.dart';

import '../base_success_response_mapper.dart';

class PlainResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, T> {
  @override
  T? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    assert(decoder == null);

    return response is T ? response : null;
  }
}
