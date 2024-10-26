import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApptextTheme {
  static TextTheme appTextTheme() {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 22.h,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18.h,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 16.h,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: TextStyle(
        fontSize: 20.h,
      ),
      displayMedium: TextStyle(
        fontSize: 14.h,
      ),
      displaySmall: TextStyle(
        fontSize: 12.h,
      ),
    );
  }
}
