import 'package:flutter/material.dart';
import 'package:donation/constant/colors.dart';

class AppTextStyles {
  AppTextStyles._(); // Private constructor to prevent instantiation

  static TextStyle? title = TextStyle(
    fontSize: 20,
    color: Colours.black,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static TextStyle? tiledetails = TextStyle(
    fontSize: 15,
    color: Colours.black,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static TextStyle? subtitle = TextStyle(
    fontSize: 12,
    color: Colours.black,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );

  static TextStyle? hintText = TextStyle(
    height: 1.0,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}