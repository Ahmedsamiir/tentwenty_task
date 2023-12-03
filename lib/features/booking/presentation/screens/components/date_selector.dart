import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  int dateIndexSelected = 1;
  List<DateTime> dates = List.generate(
      30, (index) => DateTime.now().add(Duration(days: index)));
  final ScrollController _scrollController = ScrollController();

  String _dayFormat(int dayWeek) {
    switch (dayWeek) {
      case 1:
        return "";
        break;
      case 2:
        return "TU";
        break;
      case 3:
        return "WE";
        break;
      case 4:
        return "TH";
        break;
      case 5:
        return "FR";
        break;
      case 6:
        return "Sa";
        break;
      case 7:
        return "Su";
        break;
      default:
        return "MO";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: tWhiteColor.withOpacity(0.1),
            borderRadius:  BorderRadius.circular(10),),
        child: ListView.builder(
            itemCount: dates.length,
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            shrinkWrap: true,

            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    dateIndexSelected = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 67,
                  decoration: BoxDecoration(
                    color: dateIndexSelected == index
                        ? tPrimaryColor
                        : tGreyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${dates[index].day}/${dates[index].month}',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: index == dateIndexSelected
                            ? tBlackColor
                            : tWhiteColor),
                  ),
                ),
              );
            }),
      ),
    );
  }
}