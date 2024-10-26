import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';
import 'package:wallpapertask/features/Favorite/data/repositories_impl/fav_repoimpl.dart';
import 'package:wallpapertask/wallpapers/presentation/pages/NoConnectionPage/no_connection_page.dart';
import 'package:wallpapertask/features/Favorite/presentation/Provider/FavProvider/favourite_provider.dart';
import 'package:wallpapertask/wallpapers/presentation/providers/NavigationProvider/navigation_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.data?.contains(ConnectivityResult.none) ?? false) {
          return const NoConnectionPage();
        } else {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<FavouriteProvider>(
                  create: (_) => FavouriteProvider()..getFavList(FavRepoimpl()),
                ),
                ChangeNotifierProvider<NavigationProvider>(
                    create: (_) => NavigationProvider())
              ],
              child: Consumer<NavigationProvider>(
                builder: (context, value, child) {
                  return Scaffold(
                    resizeToAvoidBottomInset: false,
                    extendBody: true,
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerFloat,
                    body: value.pages[value.currentPage],
                    floatingActionButton: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 30.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorHelper.buttonColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BottomNavigationBar(
                            currentIndex: value.currentPage,
                            onTap: (val) {
                              value.navigatePage(context: context, index: val);
                            },
                            items: const [
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.home), label: 'Home'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.grid_view_rounded),
                                  label: 'Favourite'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.search_rounded),
                                  label: 'Search'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.settings),
                                  label: 'settings'),
                            ]),
                      ),
                    ),
                  );
                },
              ));
        }
      },
    );
  }
}
