import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/features/booking/presentation/screens/components/date_selector.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context).textTheme;
    return  Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("The King’s Man", style: theme.headlineSmall?.copyWith(fontSize: 16),),
            const SizedBox(height: 6,),
            Text("In theaters december 22, 2021", style: theme.titleSmall?.copyWith(fontWeight: FontWeight.w500, color: tPrimaryColor),)
          ],
        ),
        leading: const Icon(Icons.arrow_back_ios, color: tBlackColor,),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //color: tGreyColor,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const SizedBox(height: 70,),
          Text("Date", style: theme.headlineSmall?.copyWith(fontSize: 18),),
          DateSelector(),
        ],),
      ),
    );
  }
}
