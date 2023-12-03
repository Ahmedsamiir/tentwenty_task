import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/config/app_routes.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';
import 'package:tentwenty_apptest/features/watch/presentation/components/movie_item.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_bloc.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_state.dart';
import 'package:tentwenty_apptest/features/watch/presentation/screens/movie_details_screen.dart';

class MovieComponent extends StatelessWidget {
  const MovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) => previous.upComingState != current.upComingState,
        builder: (context, state) {
          switch (state.upComingState) {
            case RequestState.loading:
              return const SizedBox(
                height: 170.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case RequestState.loaded:
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: state.upComingMovies.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final movie = state.upComingMovies[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context ,MaterialPageRoute(builder: (BuildContext context)=> MovieDetailsScreen(id: movie.id)));
                        },
                        child: MovieItem(
                          movieImage: movie.backdropPath,
                          title: movie.title,
                          customHeight: 180,
                        ));
                  });
            case RequestState.error:
              return SizedBox(
                height: 170.0,
                child: Center(
                  child: Text(state.upcomingMessage),
                ),
              );
          }
        });
  }
}
