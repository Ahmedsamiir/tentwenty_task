import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/core/presentation/components/error_text.dart';
import 'package:tentwenty_apptest/core/utils/app_strings.dart';


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.onTryAgainPressed,
  });

  final Function() onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Image.asset(
              'assets/images/icon.png',
              width: double.infinity,
              height: 150,
            ),
          ),
          const ErrorText(),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onTryAgainPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: tPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              AppString.tryAgain,
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
