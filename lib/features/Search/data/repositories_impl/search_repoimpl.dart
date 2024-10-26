import 'package:dio/dio.dart';
import 'package:wallpapertask/wallpapers/core/Api_Service/dio_requests.dart';
import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';
import 'package:wallpapertask/features/Search/domain/repositories/search_repo.dart';
import 'package:wallpapertask/wallpapers/domain/use_cases/map_photos.dart';

class SearchRepoimpl extends SearchRepo {
  @override
  Future<List<PhotoEntity>> getSearchData(String query, int page) async {
    DioRequests dioRequests = DioRequests(Dio());
    final response =
        await dioRequests.get("search?query=$query&per_page=10&page=$page");

    MapPhotosUsecase mapPhotos = MapPhotosUsecase();

    return mapPhotos.mapPhotos(response.data);
  }
}
