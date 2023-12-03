import 'package:flutter/material.dart';

class DateItem extends StatelessWidget {
  const DateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 67,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: const Text("5 Mar"),
    );
  }
}
