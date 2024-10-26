import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';

abstract class SearchRepo {
  Future<List<PhotoEntity>> getSearchData(String query, int page);
}
