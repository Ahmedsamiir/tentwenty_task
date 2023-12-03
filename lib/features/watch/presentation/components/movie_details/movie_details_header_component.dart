import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/core/constants/image_strings.dart';
import 'package:tentwenty_apptest/core/network/api_constance.dart';
import 'package:tentwenty_apptest/core/utils/enums.dart';
import 'package:tentwenty_apptest/features/watch/domain/entities/genres.dart';
import 'package:tentwenty_apptest/features/watch/presentation/controller/movie_details_bloc.dart';

class MovieDetailsHeaderComponent extends StatelessWidget {
  const MovieDetailsHeaderComponent({super.key,});


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
            return Container(
              width: double.infinity,
              height: 360,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: ApiConstance.imageUrl(state.movieDetail!.backdropPath),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 360,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: tBlackColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),

                  // ----->>> Bottom Shadow <<<-----
                  PositionedDirectional(
                    bottom: 0.0,
                    start: 0.0,
                    end: 0.0,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: AlignmentDirectional.bottomCenter,
                          end: AlignmentDirectional.topCenter,
                          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 300,
                    left: 13,
                    child: Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Watch",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 190,
                    left: 125,
                    child: Center(
                      child: Text(state.movieDetail!.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w600,color: tWhiteColor
                              )),
                    ),
                  ),
                  Positioned(
                    bottom: 159,
                    left: 66,
                    child: Container(
                        width: 250,
                        child: Text("In Theaters December 22, 2021",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,color: tWhiteColor
                                ))),
                  ),
                  Positioned(
                    bottom: 94,
                    left: 66,
                    child: Container(
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Get Tickets",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 34,
                    left: 66,
                    child: Container(
                        width: 250,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImage.tPlayImage),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Watch Trailer",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        )),
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

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
