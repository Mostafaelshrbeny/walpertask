import 'package:dio/dio.dart';
import 'package:wallpapertask/wallpapers/core/Api_Service/dio_requests.dart';

import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';
import 'package:wallpapertask/features/Home/domain/repositories/HomeRepo/home_repo.dart';
import 'package:wallpapertask/wallpapers/domain/use_cases/map_photos.dart';

class HomeRepoimpl extends HomeRepo {
  @override
  Future<List<PhotoEntity>> getHomeData(int page) async {
    DioRequests dioRequests = DioRequests(Dio());
    MapPhotosUsecase mapPhotosObj = MapPhotosUsecase();
    final response = await dioRequests.get("curated?per_page=10&page=$page");

    return mapPhotosObj.mapPhotos(response.data);
  }
}
