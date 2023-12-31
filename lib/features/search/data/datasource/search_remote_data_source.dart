import 'package:dio/dio.dart';
import 'package:tentwenty_apptest/core/error/exceptions.dart';
import 'package:tentwenty_apptest/core/network/api_constance.dart';
import 'package:tentwenty_apptest/core/network/error_message_model.dart';
import 'package:tentwenty_apptest/features/search/data/models/search_result_item_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchResultItemModel>> search(String title);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<List<SearchResultItemModel>> search(String title) async {
    final response = await Dio().get(ApiConstance.getSearchPath(title));
    if (response.statusCode == 200) {
      return List<SearchResultItemModel>.from(
          (response.data['results'] as List).where((e) => e['media_type'] != 'person').map((e) => SearchResultItemModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
