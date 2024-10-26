import 'package:dio/dio.dart';

class ApiErrorHandel {
  static String errorHandle(DioException e) {
    switch (e.response?.statusCode ?? 404) {
      case 400:
        return "Bad request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not found";
      case 500:
        return "Internal server error";
      default:
        return "Oops something went wrong";
    }
  }
}
