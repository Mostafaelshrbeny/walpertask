import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wallpapertask/wallpapers/core/Api_Service/error_handel.dart';
import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';
import 'package:wallpapertask/features/Search/domain/repositories/search_repo.dart';
import 'package:wallpapertask/wallpapers/domain/use_cases/app_snack_bar.dart';

class SearchProvider extends ChangeNotifier {
  int page = 1;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  List<PhotoEntity> searchList = [];
  bool firstLoading = false;
  bool isLoading = false;
  String errorMsg = "";

  SearchProvider(
      {required SearchRepo searchRepo, required BuildContext context}) {
    addScrollListener(context, searchRepo);
    addtextControllerListener(context, searchRepo);
  }
  Future<void> getSearchData(
      {required SearchRepo searchRepo, required BuildContext context}) async {
    page != 1 ? isLoading = true : firstLoading = true;
    notifyListeners();
    try {
      searchList += await searchRepo.getSearchData(searchController.text, page);
    } on DioException catch (e) {
      errorMsg = ApiErrorHandel.errorHandle(e);
      if (context.mounted) {
        AppSnackBar.customSnack(
            result: errorMsg,
            context: context,
            backgroundcolor: Colors.red,
            textcolor: Colors.white);
      }
    }

    isLoading = false;
    firstLoading = false;
    notifyListeners();
  }

  void addtextControllerListener(BuildContext context, SearchRepo searchRepo) {
    searchController.addListener(() async {
      if (searchController.text.isEmpty || searchController.text == " ") {
        page = 1;
        searchList = [];
        notifyListeners();
      } else {
        page = 1;
        searchList = [];
        await getSearchData(context: context, searchRepo: searchRepo);
      }
    });
  }

  void addScrollListener(BuildContext context, SearchRepo searchRepo) {
    return scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        await getSearchData(context: context, searchRepo: searchRepo);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }
}
