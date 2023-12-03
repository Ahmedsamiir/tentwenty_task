import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tentwenty_apptest/core/error/failure.dart';
import 'package:tentwenty_apptest/core/usecase/base_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/movie_detail.dart';

import 'package:tentwenty_apptest/features/watch/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
