import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';

class AppCustomTextField extends StatelessWidget {
  const AppCustomTextField({
    super.key,
    required this.label,
    this.suffixIcon,
    this.isPassword = false,
    required this.fieldController,
    this.inputType,
    this.validateMsg,
  });
  final String? label;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextInputType? inputType;
  final TextEditingController fieldController;
  final String? validateMsg;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: inputType,
        obscureText: isPassword,
        controller: fieldController,
        validator: (value) {
          if (fieldController.text.isEmpty) {
            return validateMsg;
          }
          return null;
        },
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            label: label == null ? null : Text(label!),
            fillColor: ColorHelper.grey.withOpacity(0.4),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  width: 0.5,
                  color: ColorHelper.grey.withOpacity(0.5),
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  width: 0.5,
                  color: ColorHelper.grey.withOpacity(0.5),
                ))));
  }
}
