import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/features/Home/presentation/Providers/HomeProvider/home_provider.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/wallpapers_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
      ),
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          return value.firstLoading
              ? const Center(child: CircularProgressIndicator())
              : WallpapersList(
                  scrollController: value.scrollController,
                  wallpaperList: value.homeList,
                );
        },
      ),
    );
  }
}
