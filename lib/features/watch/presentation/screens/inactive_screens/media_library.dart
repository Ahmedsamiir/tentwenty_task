import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';

class MediaLibraryScreen extends StatelessWidget {
  const MediaLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Media Library Screen",
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: tBlackColor),
      )),
    );
  }
}
