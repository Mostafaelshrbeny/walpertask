import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';
import 'package:wallpapertask/wallpapers/core/utiles/context_extension.dart';
import 'package:wallpapertask/wallpapers/presentation/pages/NoConnectionPage/no_connection_page.dart';
import 'package:wallpapertask/wallpapers/presentation/pages/NoDataPage/no_data_page.dart';
import 'package:wallpapertask/features/Favorite/presentation/Provider/FavProvider/favourite_provider.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/app_back_icon.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/wallpapers_list.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.data?.contains(ConnectivityResult.none) ?? false) {
          return const NoConnectionPage();
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: const AppBackIcon(),
            ),
            body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                children: [
                  Text(
                    "Favorites",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Gap(10.h),
                  Text("You've marked all of these as a favorite!",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: ColorHelper.lightGrey)),
                  Consumer<FavouriteProvider>(builder: (context, value, child) {
                    return value.isLoading
                        ? Padding(
                            padding: EdgeInsets.only(top: context.height / 5),
                            child: const Center(
                                child: CircularProgressIndicator.adaptive()),
                          )
                        : value.favList.isEmpty
                            ? const NoDataPage()
                            : WallpapersList(
                                horizontalPadding: 0,
                                canScroll: false,
                                scrollController: value.scrollController,
                                wallpaperList: value.favList);
                  })
                ]),
          );
        }
      },
    );
  }
}
