import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/utils/app_strings.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.oops,
          style: textTheme.titleMedium,
        ),
        Text(
          AppString.errorMessage,
          style: textTheme.bodyLarge,
        ),
        Text(
          AppString.tryAgainLater,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
