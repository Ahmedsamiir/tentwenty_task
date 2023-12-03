import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/core/network/api_constance.dart';

class MovieItem extends StatelessWidget {
  String movieImage;
  String title;
  final double? customHeight;

  MovieItem({super.key, required this.movieImage, required this.title, this.customHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      width: double.infinity,
      height: customHeight ?? 180,
      // decoration:  BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //
      // ),
      child: Stack(
        children: [
          Positioned.fill(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 120,
              fit: BoxFit.cover,
              imageUrl: ApiConstance.imageUrl(movieImage),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  height: 170.0,
                  width: 120,
                  decoration: BoxDecoration(
                    color: tBlackColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          )),

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
                )),
              )),

          Positioned(
            bottom: 20,
            left: 20,
            child: SizedBox(
                width: 150,
                child: Text(title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500, color: Colors.white))),
          ),
        ],
      ),
    );
  }
}
