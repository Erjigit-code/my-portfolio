import 'package:flutter/material.dart';

class Constants {
  static const TextStyle appBarText = TextStyle(
      color: Color(0xff000000),
      fontSize: 18,
      fontFamily: 'SFProDisplay',
      fontWeight: FontWeight.w500);
  static const TextStyle buttonTxt = TextStyle(
      color: Color(0xffFFFFFF),
      fontSize: 16,
      fontFamily: 'SFProDisplay',
      fontWeight: FontWeight.w500);

  static TextStyle appbarText2 = TextStyle(
    color: const Color(0xff000000).withOpacity(0.5),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay',
  );

  static TextStyle tapbarText2 = TextStyle(
    color: const Color(0xff000000).withOpacity(0.4),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay',
  );
  static TextStyle tapbarText = TextStyle(
    color: const Color(0xff000000),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'SFProDisplay',
  );
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff000000);
  static Color selectedColor = Color(0xff3364E0);
  static Color unselectedColor = Color(0xffF8F7F5);
}
