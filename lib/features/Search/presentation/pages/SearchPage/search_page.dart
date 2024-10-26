import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';
import 'package:wallpapertask/features/Search/data/repositories_impl/search_repoimpl.dart';
import 'package:wallpapertask/features/Search/presentation/Providers/SearchProvider/search_provider.dart';
import 'package:wallpapertask/wallpapers/presentation/pages/NoConnectionPage/no_connection_page.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/app_back_icon.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/app_custom_textfield.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/wallpapers_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.data?.contains(ConnectivityResult.none) ?? false) {
          return const NoConnectionPage();
        } else {
          return ChangeNotifierProvider(
            create: (_) =>
                SearchProvider(searchRepo: SearchRepoimpl(), context: context),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                body: Consumer<SearchProvider>(
                  builder: (context, value, child) {
                    return SafeArea(
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 20.h),
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Search",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    Gap(10.h),
                                    Text(
                                        "Searching through thousands of photos will be much easier now",
                                        maxLines: 2,
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                                color: ColorHelper.lightGrey)),
                                  ],
                                ),
                              ),
                              const AppBackIcon(
                                icon: Icons.close,
                                padding: EdgeInsets.all(5),
                              )
                            ],
                          ),
                          Gap(20.h),
                          AppCustomTextField(
                            label: null,
                            fieldController: value.searchController,
                            suffixIcon:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Icon(
                                Icons.tune,
                                color: Theme.of(context).iconTheme.color,
                              )
                            ]),
                          ),
                          value.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : value.searchList.isEmpty
                                  ? const SizedBox()
                                  : WallpapersList(
                                      verticalPadding: 20.h,
                                      horizontalPadding: 0,
                                      scrollController: value.scrollController,
                                      wallpaperList: value.searchList)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
