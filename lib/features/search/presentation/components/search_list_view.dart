import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/features/search/domain/entities/search_result_item.dart';
import 'package:tentwenty_apptest/features/search/presentation/components/list_view_card.dart';


class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
    required this.results,
  });

  final List<SearchResultItem> results;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: results.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListViewCard(item: results[index]);
        },
      ),
    );
  }
}
