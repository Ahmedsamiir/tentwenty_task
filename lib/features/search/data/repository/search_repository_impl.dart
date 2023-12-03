import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:tentwenty_apptest/core/error/exceptions.dart';
import 'package:tentwenty_apptest/core/error/failure.dart';
import 'package:tentwenty_apptest/features/search/data/datasource/search_remote_data_source.dart';
import 'package:tentwenty_apptest/features/search/domain/entities/search_result_item.dart';
import 'package:tentwenty_apptest/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource _baseSearchRemoteDataSource;

  SearchRepositoryImpl(this._baseSearchRemoteDataSource);

  @override
  Future<Either<Failure, List<SearchResultItem>>> search(String title) async {
    try {
      final result = await _baseSearchRemoteDataSource.search(title);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
