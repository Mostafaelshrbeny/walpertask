import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/custom_button.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("No Internet Connection",
                  style: Theme.of(context).textTheme.titleLarge),
              Gap(10.h),
              Text("It Looks Like you're not Connected to the Internet",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: ColorHelper.lightGrey)),
              Center(child: SvgPicture.asset("assets/images/No Interner.svg")),
              const Spacer(),
              AppCustomButton(
                  margin: EdgeInsets.only(bottom: 20.h),
                  child: Text("Try Again...",
                      style: Theme.of(context).textTheme.titleMedium),
                  ontap: () {}),
            ],
          ),
        ));
  }
}
