import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/features/authentication/presentation/widgets/Auth_Widget/password_filed.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';
import 'package:wallpapertask/features/authentication/data/repositories_impl/Auth_RepoImpl/auth_repoimpl.dart';
import 'package:wallpapertask/wallpapers/domain/use_cases/app_snack_bar.dart';
import 'package:wallpapertask/features/authentication/presentation/pages/LoginPage/login_page.dart';
import 'package:wallpapertask/features/authentication/presentation/Providers/AuthProvider/signup_provider.dart';

import 'package:wallpapertask/wallpapers/presentation/widgets/app_custom_textfield.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/auth_change.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/custom_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupProvider>(
      create: (_) => SignupProvider(),
      child: Consumer<SignupProvider>(
        builder: (context, value, child) => GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(),
            body: Form(
              key: value.formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                children: [
                  Text(
                    "Let's Sign You In",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Gap(10.h),
                  Text("Welcome back, You've been missed",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: ColorHelper.lightGrey)),
                  Gap(30.h),
                  AppCustomTextField(
                      validateMsg: "Please Enter a valid Email",
                      inputType: TextInputType.emailAddress,
                      label: 'Enter Your Email',
                      fieldController: value.mailController),
                  Gap(30.h),
                  Selector<SignupProvider, bool>(
                    selector: (_, myType) => myType.isPasswodVisible,
                    builder: (context, ispass, child) {
                      return PassWordFiled(
                        ontap: () => value.showpassword(isConfirm: false),
                        isHidden: ispass,
                        controller: value.passController,
                      );
                    },
                  ),
                  Gap(30.h),
                  Selector<SignupProvider, bool>(
                    selector: (_, myType) => myType.isConfirmPasswodVisible,
                    builder: (context, ispass, child) {
                      return PassWordFiled(
                        ontap: () => value.showpassword(isConfirm: true),
                        isHidden: ispass,
                        controller: value.confirmPassController,
                      );
                    },
                  ),
                  Gap(20.h),
                  Consumer<SignupProvider>(builder: (context, value, child) {
                    return AppCustomButton(
                      ontap: () {
                        if (value.formKey.currentState!.validate() &&
                            value.passController.text ==
                                value.confirmPassController.text) {
                          value.signup(
                              context: context, authrepo: AuthRepoimpl());
                        } else {
                          AppSnackBar.customSnack(
                              result: "Password doesn't match",
                              context: context,
                              backgroundcolor: Colors.red,
                              textcolor: Colors.white);
                        }
                      },
                      child: context.watch<SignupProvider>().isLoading
                          ? const CircularProgressIndicator()
                          : Text("Register",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white)),
                    );
                  }),
                  Gap(40.h),
                  Center(
                    child: Text(
                      "or continue with social account",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: ColorHelper.lightGrey),
                    ),
                  ),
                  Gap(40.h),
                  Row(
                    children: [
                      Expanded(
                        child: AppCustomButton(
                          backgrondcolor: ColorHelper.blue,
                          borderColor: ColorHelper.blue,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.facebook,
                                color: ColorHelper.white,
                                size: 18,
                              ),
                              Gap(5.w),
                              Text(
                                "Sign in With Facebook",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: ColorHelper.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      Gap(20.h),
                      Expanded(
                        child: AppCustomButton(
                          backgrondcolor: Colors.transparent,
                          borderColor: ColorHelper.blue,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons8-google.svg",
                                height: 18.h,
                              ),
                              Gap(8.w),
                              Text(
                                "Sign in With Google",
                                style: Theme.of(context).textTheme.displaySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(20.h),
                  const AuthTextRich(
                    firstlabel: "Already have an account? ",
                    secondlabel: "Sign In",
                    secondPage: LoginPage(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
