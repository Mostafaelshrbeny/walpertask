import 'package:wallpapertask/features/Favorite/domain/repositories/fav_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';

class FavRepoimpl extends FavRepo {
  CollectionReference favorites =
      FirebaseFirestore.instance.collection('favorites');
  @override
  Future<List<PhotoEntity>> getFavData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('favorites').get();

    return querySnapshot.docs.map((doc) {
      return PhotoEntity.fromFirestore(
          doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  @override
  Future<void> addToFavData(PhotoEntity photo) async {
    await favorites.add({
      'id': photo.photoid,
      'url': photo.photourl,
    });
  }

  @override
  Future<void> removeFromFavData(PhotoEntity photo) async {
    await favorites.doc(photo.photoDocId).delete();
  }
}
