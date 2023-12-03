import 'package:equatable/equatable.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> upComingMovies;
  final RequestState upComingState;
  final String upcomingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  // Search
  final List<Movie> searchResultMovie;

  final RequestState searchMovieState;
  final String searchMessage;

  const MoviesState({
    this.upComingMovies = const [],
    this.upComingState = RequestState.loading,
    this.upcomingMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
    this.searchMovieState = RequestState.loading,
    this.searchResultMovie = const [],
    this.searchMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
    List<Movie>? searchResultMovie,
    RequestState? searchMovieState,
    String? searchMessage,
  }) {
    return MoviesState(
      upComingMovies: nowPlayingMovies ?? upComingMovies,
      upComingState: nowPlayingState ?? upComingState,
      upcomingMessage: nowPlayingMessage ?? upcomingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      searchResultMovie: searchResultMovie ?? this.searchResultMovie,
      searchMovieState: searchMovieState ?? this.searchMovieState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [
        upComingMovies,
        upComingState,
        upcomingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
        searchResultMovie,
        searchMovieState,
        searchMessage
      ];
}
