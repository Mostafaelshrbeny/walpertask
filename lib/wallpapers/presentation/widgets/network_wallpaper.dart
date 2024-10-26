import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NetworkWallpaper extends StatelessWidget {
  const NetworkWallpaper({
    super.key,
    required this.imageUrl,
    this.onlike,
    required this.likeicon,
  });
  final String imageUrl;
  final Function()? onlike;
  final Widget likeicon;
  @override
  Widget build(BuildContext context) {
    return
        //Image.network(imageUrl);
        CachedNetworkImage(
            // progressIndicatorBuilder: (context, url, downloadProgress) =>
            //     CircularProgressIndicator(value: downloadProgress.progress),
            fadeInDuration: const Duration(seconds: 2),
            fadeOutDuration: const Duration(seconds: 2),
            memCacheHeight:
                (50 * MediaQuery.of(context).devicePixelRatio).round(),
            memCacheWidth:
                (50 * MediaQuery.of(context).devicePixelRatio).round(),
            imageUrl: imageUrl,
            placeholder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Container(
                    height: 200,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                  ),
                ),
            // Shimmer.fromColors(
            //       baseColor: Colors.white,
            //       highlightColor: Colors.grey,
            //       child: Container(
            //         height: 200,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(10)),
            //         margin:
            //             const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //       ),
            //     ),
            imageBuilder: (context, imageProvider) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(onPressed: onlike, icon: likeicon))
                    ],
                  ),
                ),
              );
            });
  }
}

// class Wallpaper extends StatelessWidget {
//   const Wallpaper({
//     super.key,
//     required this.imageUrl,
//     required this.height,
//     required this.width,
//   });

//   final String imageUrl;
//   final double height;
//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }
