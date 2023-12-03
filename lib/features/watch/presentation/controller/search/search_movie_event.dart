import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_event.dart';

class SearchMoviesEvent extends MoviesEvent {
  final String query;

  const SearchMoviesEvent(this.query);
}
