import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/usecase/base_usecase.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tentwenty_apptest/features/watch/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_event.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_state.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/search/search_movie_event.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getUpcomingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetUpcomingMoviesEvent>(_getUpcomingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);

  }


  FutureOr<void> _getUpcomingMovies(
      GetUpcomingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getUpcomingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        popularMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (l) => emit(state.copyWith(
        topRatedMessage: l.message,
        topRatedState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
