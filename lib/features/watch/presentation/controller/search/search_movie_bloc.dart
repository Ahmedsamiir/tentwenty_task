import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/movie.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_event.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_state.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/search/search_movie_event.dart';

class SearchMoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  final List<Movie> allMovies; // store all movies initially

  SearchMoviesBloc(
      this.allMovies,
      ) : super(const MoviesState());

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is SearchMoviesEvent) {
      yield* _mapSearchMoviesEventToState(event);
    } else if (event is GetUpcomingMoviesEvent) {
      // handle existing events...
    }
  }

  Stream<MoviesState> _mapSearchMoviesEventToState(
      SearchMoviesEvent event) async* {
    // Filter movies based on the search query
    final List<Movie> searchResults = allMovies
        .where((movie) =>
        movie.title.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    yield state.copyWith(
      searchResultMovie: searchResults,
      searchMovieState: RequestState.loaded,
    );
  }
}
