import 'package:flutter/material.dart';

import 'package:wallpapertask/wallpapers/presentation/widgets/app_custom_textfield.dart';

class PassWordFiled extends StatelessWidget {
  const PassWordFiled({
    super.key,
    required this.controller,
    required this.isHidden,
    this.ontap,
  });
  final TextEditingController controller;
  final bool isHidden;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return AppCustomTextField(
        validateMsg: "Please Enter Password",
        label: 'Enter Your Password',
        inputType: TextInputType.visiblePassword,
        isPassword: isHidden,
        suffixIcon: IconButton(
            onPressed: ontap,
            icon: Icon(
              isHidden
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Theme.of(context).iconTheme.color,
            )),
        fieldController: controller);
  }
}
