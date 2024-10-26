import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnack(
      {required String result,
      required BuildContext context,
      Color? backgroundcolor,
      Color? textcolor}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Text(
        result,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: textcolor),
      ),
    ));
  }
}
