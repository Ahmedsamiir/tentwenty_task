import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Dashboard Screen",
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: tBlackColor),
      )),
    );
  }
}
