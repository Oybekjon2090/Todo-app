import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Style{

  Style._();

  static const primaryColor = Color(0xffFFFFF);
  static const whiteColor = Colors.white;
  static const cyanColor = Colors.cyan;
  static const blackColor = Colors.black;
  static const transperent = Colors.transparent;
  static const greenColor = Colors.green;


  static const primaryGradient = LinearGradient(
     begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.cyan,
        Colors.cyan
      ]);
  static const primaryDisableGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0x50beeeee),
        Color(0x50beeeee),
      ]);


  static textStyleNormal({double size = 16, Color textColor = blackColor,bool isDone =false}) => TextStyle(
    fontSize: size,
    color: textColor,
    fontWeight: FontWeight.normal,
    decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none
  );

  static textStyleSemiBold({double size = 18, Color textColor = blackColor}) => TextStyle(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w600,
      );

  static textStyleBold({double size = 18, Color textColor = blackColor}) => TextStyle(
    fontSize: size,
    color: textColor,
    fontWeight: FontWeight.bold,
  );

  static textStyleRegular({double size = 18, Color textColor = blackColor}) => TextStyle(
    fontSize: size,
    color: textColor,
    fontWeight: FontWeight.w400,
  );
}