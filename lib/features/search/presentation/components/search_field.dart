import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/core/utils/app_strings.dart';
import 'package:tentwenty_apptest/features/search/presentation/controllers/search_bloc/search_bloc.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      child: TextFormField(
        controller: _textController,
        cursorColor: tBlackColor,
        cursorWidth: 1,
        style: textTheme.bodyLarge,


        onChanged: (title) {
          context.read<SearchBloc>().add(GetSearchResultsEvent(title));
        },
        decoration: InputDecoration(
          fillColor: tSemiWhiteColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: tGreyColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: tGreyColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: tBlackColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _textController.text = '';
              context.read<SearchBloc>().add(const GetSearchResultsEvent(''));
            },
            child: const Icon(
              Icons.clear_rounded,
              color: tBlackColor,
            ),
          ),
          hintText: AppString.searchHint,
          hintStyle: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400,color: tBlackColor.withOpacity(0.3)),
        ),
      ),
    );
  }
}
