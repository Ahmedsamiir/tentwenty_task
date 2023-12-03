import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tentwenty_apptest/features/search/domain/entities/search_result_item.dart';
import 'package:tentwenty_apptest/features/search/presentation/components/dots.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({super.key, required this.item});

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        /// Todo
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: item.posterUrl,
                    height: 100,
                    width: 130,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (_, __, ___) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Column(
                children: [
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineSmall?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          const Dots(),
        ],
      ),
    );
  }
}
