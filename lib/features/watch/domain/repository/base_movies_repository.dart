import 'package:dartz/dartz.dart';
import 'package:tentwenty_apptest/core/error/failure.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/movie.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/movie_detail.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/recommendation.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_movie_details_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_recommendation_usecase.dart';


abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
