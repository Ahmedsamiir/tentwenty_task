import 'package:dartz/dartz.dart';
import 'package:tentwenty_apptest/core/error/exceptions.dart';
import 'package:tentwenty_apptest/core/error/failure.dart';
import 'package:tentwenty_apptest/features/watch/data/datasource/movie_remote_data_source.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/movie.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/movie_detail.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/recommendation.dart';
import 'package:tentwenty_apptest/features/watch/domain/repository/base_movies_repository.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_movie_details_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() async {
    final result = await baseMovieRemoteDataSource.getUpcomingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
