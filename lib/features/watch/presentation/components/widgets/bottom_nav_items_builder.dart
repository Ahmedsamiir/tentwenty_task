import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_apptest/core/constants/colors.dart';
import 'package:tentwenty_apptest/core/constants/dimension.dart';


BottomNavigationBarItem bottomNavigationBarItemBuilder({required String iconPath,required String label}){


  print('ffa $label');
  return BottomNavigationBarItem(
    backgroundColor: tBlueColor,
    icon: Center(
      child: Padding(
        padding:  const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL,top: Dimensions.PADDING_SIZE_SMALL,),
        child: SvgPicture.asset(iconPath,width:16,color: tGreyColor,height: 16,fit: BoxFit.cover),
      ),
    ),
    label: label,

    activeIcon: Center(
      child: Padding(
        padding:  const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL,top: Dimensions.PADDING_SIZE_SMALL,),
        child: SvgPicture.asset(iconPath,width: 16,color: Colors.white,height: 16,fit: BoxFit.cover),
      ),
    ),
  );
}

