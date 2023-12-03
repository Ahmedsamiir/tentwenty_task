import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: Text(
          "More Screen",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: tBlackColor),
        ),
      ),
    );
  }
}
