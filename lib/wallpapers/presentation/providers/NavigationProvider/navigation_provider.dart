import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/features/Favorite/data/repositories_impl/fav_repoimpl.dart';
import 'package:wallpapertask/features/Favorite/presentation/Provider/FavProvider/favourite_provider.dart';
import 'package:wallpapertask/features/Home/data/repositories_impl/Home_RepoImpl/home_repoimpl.dart';
import 'package:wallpapertask/features/Favorite/presentation/pages/FavoritesPage/favorite_page.dart';
import 'package:wallpapertask/features/Home/presentation/pages/HomePage/home_page.dart';
import 'package:wallpapertask/features/Search/presentation/pages/SearchPage/search_page.dart';
import 'package:wallpapertask/features/Home/presentation/Providers/HomeProvider/home_provider.dart';

class NavigationProvider extends ChangeNotifier {
  List<Widget> pages = [
    ChangeNotifierProvider(
      create: (_) => HomeProvider(homeRepo: HomeRepoimpl()),
      child: const HomePage(),
    ),
    const FavoritePage(),
    const SearchPage(),
    const HomePage()
  ];
  int currentPage = 0;

  navigatePage({required int index, required BuildContext context}) {
    if (index == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                    value: context.read<FavouriteProvider>(),
                    child: const SearchPage(),
                  )));
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                    value: context.watch<FavouriteProvider>()
                      ..getFavList(FavRepoimpl()),
                    child: const FavoritePage(),
                  )));
    } else if (index == 3) {
      null;
    } else {
      currentPage = index;
    }
    notifyListeners();
  }
}
