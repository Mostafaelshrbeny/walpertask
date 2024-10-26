import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';

class AppBackIcon extends StatelessWidget {
  const AppBackIcon({
    super.key,
    this.icon,
    this.padding,
  });
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: padding,
        margin: EdgeInsets.only(left: 15.w, top: 8.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorHelper.lightGrey.withOpacity(0.7)),
        child: Icon(
          icon ?? Icons.arrow_back_ios_new,
          color: Colors.black.withOpacity(0.6),
          size: 24,
        ),
      ),
    );
  }
}
