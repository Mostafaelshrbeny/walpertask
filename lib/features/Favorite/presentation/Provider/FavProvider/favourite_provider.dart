import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpapertask/wallpapers/core/Api_Service/firebase_errorhandel.dart';
import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';
import 'package:wallpapertask/features/Favorite/domain/repositories/fav_repo.dart';

class FavouriteProvider extends ChangeNotifier {
  List<PhotoEntity> favList = [];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  Future getFavList(FavRepo favRepo) async {
    try {
      favList = await favRepo.getFavData();
    } on FirebaseException catch (e) {
      FirebaseErrorHandler.handleError(e);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addToFavList(PhotoEntity photo, FavRepo favRepo) async {
    try {
      if (favList.contains(photo)) {
        await favRepo.removeFromFavData(photo);
        if (photo.photoDocId != null) {
          favList
              .removeWhere((element) => element.photoDocId == photo.photoDocId);
        } else {
          favList.removeWhere((element) => element.photoid == photo.photoid);
        }
      } else {
        await favRepo.addToFavData(photo);
        favList.add(photo);
      }
      notifyListeners();
    } on FirebaseException catch (e) {
      FirebaseErrorHandler.handleError(e);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
