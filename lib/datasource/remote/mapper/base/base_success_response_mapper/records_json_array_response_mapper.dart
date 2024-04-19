import 'package:clean_architecture_biv/shared/model/typedef.dart';

import '../../../../model/base/record_response.dart';
import '../base_success_response_mapper.dart';

class RecordsJsonArrayResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, RecordsListResponse<T>> {
  @override
  RecordsListResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? RecordsListResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}
