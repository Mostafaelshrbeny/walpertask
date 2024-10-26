import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';

abstract class FavRepo {
  Future<List<PhotoEntity>> getFavData();

  Future<void> addToFavData(PhotoEntity photo);

  Future<void> removeFromFavData(PhotoEntity photo);
}
