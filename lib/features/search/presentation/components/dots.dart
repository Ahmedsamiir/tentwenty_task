import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            width: 4,
            height: 4,
            color: tPrimaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            width: 4,
            height: 4,
            color: tPrimaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            width: 4,
            height: 4,
            color: tPrimaryColor,
          ),
        ),
      ],
    );
  }
}
