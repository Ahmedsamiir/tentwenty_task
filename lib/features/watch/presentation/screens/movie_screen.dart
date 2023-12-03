import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/core/dependency_injection/services_locator.dart';
import 'package:tentwenty_apptest/core/utils/app_strings.dart';
import 'package:tentwenty_apptest/features/search/presentation/screens/search_screen.dart';
import 'package:tentwenty_apptest/features/watch/presentation/components/movie_component.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_bloc.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_event.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movies_state.dart';

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()..add(GetUpcomingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
                  // key: const Key('movieScrollView'),
                  child: Container(
                    color: tGreyColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AppBar Section
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          height: 70,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppString.tWatch, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16)),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const SearchScreen()));
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Body Section
                        const MovieComponent(),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
