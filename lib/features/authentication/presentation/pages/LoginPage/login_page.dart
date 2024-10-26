import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/features/authentication/presentation/widgets/Auth_Widget/password_filed.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';
import 'package:wallpapertask/features/authentication/data/repositories_impl/Auth_RepoImpl/auth_repoimpl.dart';
import 'package:wallpapertask/features/authentication/presentation/pages/SignupPage/signup_page.dart';
import 'package:wallpapertask/features/authentication/presentation/Providers/AuthProvider/login_provider.dart';

import 'package:wallpapertask/wallpapers/presentation/widgets/app_custom_textfield.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/auth_change.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Consumer(builder: (context, LoginProvider value, child) {
              return Scaffold(
                appBar: AppBar(),
                body: Form(
                  key: value.formKey,
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                      Selector<LoginProvider, bool>(
                        selector: (_, myType) => myType.isPasswodVisible,
                        builder: (context, ispass, child) {
                          return PassWordFiled(
                            ontap: () {
                              value.showpassword();
                            },
                            isHidden: ispass,
                            controller: value.passController,
                          );
                        },
                      ),
                      Gap(20.h),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Your Password?",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: ColorHelper.buttonColor),
                            ),
                          )),
                      Gap(20.h),
                      AppCustomButton(
                        ontap: () {
                          if (context
                              .read<LoginProvider>()
                              .formKey
                              .currentState!
                              .validate()) {
                            value.login(
                                context: context, authrepo: AuthRepoimpl());
                          }
                        },
                        child: context.watch<LoginProvider>().isLoading
                            ? const CircularProgressIndicator()
                            : Text("Login",
                                style: Theme.of(context).textTheme.titleMedium),
                      ),
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
                      AppCustomButton(
                        backgrondcolor: ColorHelper.blue,
                        borderColor: ColorHelper.blue,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.facebook,
                              color: ColorHelper.white,
                              size: 25,
                            ),
                            Gap(10.w),
                            Text(
                              "Sign in With Facebook",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: ColorHelper.white),
                            )
                          ],
                        ),
                      ),
                      Gap(20.h),
                      AppCustomButton(
                        backgrondcolor: Colors.transparent,
                        borderColor: ColorHelper.blue,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/images/icons8-google.svg",
                              height: 25.h,
                            ),
                            Gap(20.w),
                            Text(
                              "Sign in With Google",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Gap(20.h),
                      const AuthTextRich(
                        firstlabel: "Don't have an account? ",
                        secondlabel: "Sign Up",
                        secondPage: SignupPage(),
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }
}
