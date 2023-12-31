import 'package:flutter/material.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';

class TAppBarTheme{
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,

    iconTheme: IconThemeData(color: tBlackColor, size: 25.0),
    toolbarHeight: 50,
    actionsIconTheme: IconThemeData(color: tBlackColor, size: 25.0),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,

    iconTheme: IconThemeData(color: tWhiteColor, size: 18.0),
    actionsIconTheme: IconThemeData(color: tWhiteColor, size: 18.0),
  );
}