import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tentwenty_apptest/core/dependency_injection/services_locator.dart';
import 'package:tentwenty_apptest/features/watch/presentation/components/movie_details/movie_details_body_component.dart';
import 'package:tentwenty_apptest/features/watch/presentation/components/movie_details/movie_details_header_component.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movie_details_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
   final id;

    const MovieDetailsScreen({super.key,   this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<MovieDetailsBloc>()..add(GetMovieDetailsEvent(id)) ..add(GetMovieRecommendationEvent(id) ),
        lazy: false,
        child: const Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                MovieDetailsHeaderComponent(),
                SizedBox(
                  height: 26,
                ),

                // Body Section
                MovieDetailsBodyComponent()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
