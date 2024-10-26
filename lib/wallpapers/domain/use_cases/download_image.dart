import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:wallpapertask/wallpapers/core/Api_Service/dio_requests.dart';
import 'package:wallpapertask/wallpapers/domain/use_cases/app_snack_bar.dart';

class DownloadImage {
  Future<void> downloadImage(
      {required String url, required BuildContext context}) async {
    try {
      DioRequests dioRequests = DioRequests(Dio());

      final Response response = await dioRequests.download(urlPath: url);
      await saveImagetoGallery(response: response, url: url);
      if (context.mounted) {
        AppSnackBar.customSnack(
            result: "Downloaded Successfully",
            context: context,
            backgroundcolor: Colors.green,
            textcolor: Colors.white);
      }
    } on DioException catch (e) {
      if (context.mounted) {
        AppSnackBar.customSnack(
            result: e.toString(),
            context: context,
            backgroundcolor: Colors.red,
            textcolor: Colors.white);
      }
    }
  }

  Future<void> saveImagetoGallery(
      {required Response response, required String url}) async {
    await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 60,
      name: url.split('/').last,
    );
  }
}
