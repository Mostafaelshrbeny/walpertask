import 'package:wallpapertask/wallpapers/data/models/photomodel.dart';
import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';

class MapPhotosUsecase {
  List<PhotoEntity> mapPhotos(Map<String, dynamic> response) {
    PhotoModel photoModel;
    photoModel = PhotoModel.fromJson(response);
    List<PhotoEntity> photosRes = [];

    if (photoModel.photos != null) {
      for (Photos photo in photoModel.photos ?? []) {
        photosRes.add(PhotoEntity(
          photoid: photo.id,
          photourl: photo.src?.original ?? "",
        ));
      }
    }

    return photosRes;
  }
}
