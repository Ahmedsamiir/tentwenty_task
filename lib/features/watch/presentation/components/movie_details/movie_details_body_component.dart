
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';
import 'package:tentwenty_apptest/features/watch/presentation/components/widgets/genres.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movie_details_bloc.dart';

class MovieDetailsBodyComponent extends StatelessWidget {


  const MovieDetailsBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
      switch (state.movieDetailsState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case RequestState.loaded:
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Genres",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GenresItem(color: tSecondaryColor, title: "Action"),
                    const SizedBox(
                      width: 5,
                    ),
                    GenresItem(color: tPinkColor, title: "Thriller"),
                    const SizedBox(
                      width: 5,
                    ),
                    GenresItem(color: tPurpleColor, title: "Science"),
                    const SizedBox(
                      width: 5,
                    ),
                    GenresItem(color: tYellowColor, title: "Fiction"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Overview",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  state.movieDetail!.overview,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),

                ),
              ],
            ),
          );

        case RequestState.error:
          return Center(child: Text(state.movieDetailsMessage));
      }
      },

    );
  }
}
