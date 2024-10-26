import 'package:dio/dio.dart';
import 'package:wallpapertask/wallpapers/core/Api_Service/api_const.dart';

class DioRequests {
  final Dio dio;
  DioRequests(this.dio);

  Future<Response> get(String url) async {
    return await dio.get(
      "${ApiConstants.baseUrl}$url",
      options: Options(headers: {'Authorization': ApiConstants.apiKey}),
    );
  }

  Future download({required String urlPath}) async {
    return await dio.get(urlPath,
        options: Options(responseType: ResponseType.bytes));
  }
}
