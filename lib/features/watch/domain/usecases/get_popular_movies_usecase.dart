import 'package:dartz/dartz.dart';
import 'package:tentwenty_apptest/core/error/failure.dart';
import 'package:tentwenty_apptest/core/usecase/base_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/movie.dart';
import 'package:tentwenty_apptest/features/watch/domain/repository/base_movies_repository.dart';


class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
