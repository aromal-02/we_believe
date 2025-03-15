import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {

   void show(String message,
      {Color backgroundColor = Colors.red,
      Color textColor = Colors.white,
      ToastGravity gravity = ToastGravity.BOTTOM,
      double fontSize = 16.0}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
