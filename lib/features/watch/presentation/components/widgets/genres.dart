import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';

class GenresItem extends StatelessWidget {
  Color color;
  String title;

  GenresItem({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Text(
        title ?? "",
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16, color: tWhiteColor),
      ),
    );
  }
}
