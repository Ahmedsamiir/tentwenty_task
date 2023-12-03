import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/utils/app_strings.dart';


class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppString.tSearch,
            style: textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              AppString.searchText,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
