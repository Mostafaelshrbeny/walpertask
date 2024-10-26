import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallpapertask/features/Favorite/data/repositories_impl/fav_repoimpl.dart';
import 'package:wallpapertask/wallpapers/domain/entities/PhotoEntity/photo_entity.dart';
import 'package:wallpapertask/wallpapers/presentation/pages/FullscreenImage/fullscreen_image.dart';
import 'package:wallpapertask/features/Favorite/presentation/Provider/FavProvider/favourite_provider.dart';
import 'package:wallpapertask/wallpapers/presentation/widgets/network_wallpaper.dart';

class WallpapersList extends StatelessWidget {
  const WallpapersList({
    super.key,
    required this.scrollController,
    required this.wallpaperList,
    this.canScroll = true,
    this.horizontalPadding,
    this.verticalPadding,
  });
  final ScrollController scrollController;
  final List<PhotoEntity> wallpaperList;
  final bool canScroll;
  final double? horizontalPadding, verticalPadding;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: canScroll ? null : const NeverScrollableScrollPhysics(),
      controller: scrollController,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20, vertical: verticalPadding ?? 20),
      itemCount: wallpaperList.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider.value(
                        value: context.watch<FavouriteProvider>(),
                        child: FullscreenImage(photo: wallpaperList[index]))));
          },
          child: NetworkWallpaper(
            likeicon: context
                    .watch<FavouriteProvider>()
                    .favList
                    .contains(wallpaperList[index])
                ? const FaIcon(FontAwesomeIcons.solidHeart,
                    color: Colors.red, size: 25)
                : const FaIcon(FontAwesomeIcons.heart),
            onlike: () async {
              await context
                  .read<FavouriteProvider>()
                  .addToFavList(wallpaperList[index], FavRepoimpl());
            },
            imageUrl:
                wallpaperList[index].photourl ?? "https://placehold.co/600x400",
          ),
        );
      },
    );
  }
}
