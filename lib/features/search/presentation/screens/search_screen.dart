
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/core/presentation/components/error_text.dart';
import 'package:tentwenty_apptest/core/presentation/components/loading_indicator.dart';
import 'package:tentwenty_apptest/core/utils/app_strings.dart';
import 'package:tentwenty_apptest/features/search/presentation/components/no_results.dart';
import 'package:tentwenty_apptest/features/search/presentation/components/search_field.dart';
import 'package:tentwenty_apptest/features/search/presentation/components/search_list_view.dart';
import 'package:tentwenty_apptest/features/search/presentation/components/search_text.dart';
import 'package:tentwenty_apptest/features/search/presentation/controllers/search_bloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const SizedBox(height: 15,),

               const SearchField(),
              const SizedBox(height: 25,),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  switch (state.status) {
                    case SearchRequestStatus.empty:
                      return const SearchText();
                    case SearchRequestStatus.loading:
                      return const Expanded(child: LoadingIndicator());
                    case SearchRequestStatus.loaded:
                      return SearchListView(results: state.searchResults);
                    case SearchRequestStatus.error:
                      return const Expanded(child: ErrorText());
                    case SearchRequestStatus.noResults:
                      return const NoResults();
                  }
                },
              ),



            ],
          ),
        ),
      ),
    );
  }
}
