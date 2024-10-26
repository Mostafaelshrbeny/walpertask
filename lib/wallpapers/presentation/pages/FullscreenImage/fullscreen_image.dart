import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/features/Favorite/data/repositories_impl/fav_repoimpl.dart';
import 'package:wallpapertask/features/Favorite/presentation/Provider/FavProvider/favourite_provider.dart';
import 'package:wallpapertask/wallpapers/core/utiles/color_helper.dart';
import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';
import 'package:wallpapertask/wallpapers/domain/use_cases/download_image.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/app_back_icon.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/custom_button.dart';

class FullscreenImage extends StatelessWidget {
  const FullscreenImage({super.key, required this.photo});
  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leadingWidth: 50.w,
          forceMaterialTransparency: true,
          leading: const AppBackIcon(),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 20.w, top: 10.w),
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
                size: 35,
              ),
            )
          ],
        ),
        extendBody: true,
        body: CachedNetworkImage(
          imageUrl: photo.photourl ?? "",
          imageBuilder: (context, imageProvider) {
            return Stack(
              children: [
                Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<FavouriteProvider>(builder: (context, ref, child) {
                      return IconButton(
                          onPressed: () {
                            ref.addToFavList(photo, FavRepoimpl());
                          },
                          icon: context
                                  .watch<FavouriteProvider>()
                                  .favList
                                  .contains(photo)
                              ? const FaIcon(FontAwesomeIcons.solidHeart,
                                  color: Colors.red, size: 25)
                              : const FaIcon(FontAwesomeIcons.heart));
                    }),
                    Gap(10.h),
                    IconButton(
                        onPressed: () async {
                          await DownloadImage().downloadImage(
                              url: photo.photourl ?? "", context: context);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.download,
                          size: 30,
                        )),
                    Gap(10.h),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                          size: 30,
                        )),
                    AppCustomButton(
                      backgrondcolor: ColorHelper.buttonColor.withOpacity(0.6),
                      withBorder: false,
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 30.w),
                      child: Text(
                        "Apply",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  ],
                )
              ],
            );
          },
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          errorWidget: (context, url, error) => Center(
            child: SvgPicture.asset("assets/images/404 NotFound.svg"),
          ),
        ));
  }
}
