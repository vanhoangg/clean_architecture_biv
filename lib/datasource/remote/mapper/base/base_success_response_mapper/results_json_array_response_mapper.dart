import 'package:clean_architecture_biv/shared/model/typedef.dart';

import '../../../../model/base/result_response.dart';
import '../base_success_response_mapper.dart';

class ResultsJsonArrayResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, ResultsListResponse<T>> {
  @override
  ResultsListResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? ResultsListResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}
