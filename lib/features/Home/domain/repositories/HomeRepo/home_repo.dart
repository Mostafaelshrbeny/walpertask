import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';

abstract class HomeRepo {
  Future<List<PhotoEntity>> getHomeData(int page);
}
