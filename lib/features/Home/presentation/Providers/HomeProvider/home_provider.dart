import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpapertask/wallpapers/core/Api_Service/error_handel.dart';
import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';
import 'package:wallpapertask/features/Home/domain/repositories/HomeRepo/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  int page = 1;
  ScrollController scrollController = ScrollController();
  List<PhotoEntity> homeList = [];
  bool firstLoading = false;
  bool isLoading = false;
  String errorMsg = "";

  HomeProvider({required HomeRepo homeRepo}) {
    getHomeData(homeRepo: homeRepo);
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          !firstLoading) {
        await getHomeData(homeRepo: homeRepo);
      }
    });
  }

  Future<void> getHomeData({required HomeRepo homeRepo}) async {
    page != 1 ? isLoading = true : firstLoading = true;
    notifyListeners();
    try {
      homeList += await homeRepo.getHomeData(page);
    } on DioException catch (e) {
      errorMsg = ApiErrorHandel.errorHandle(e);
    }

    page++;
    isLoading = false;
    firstLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
