import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/data/constant/api_constant.dart';
import 'package:dating/data/constant/theme_constant.dart';
import 'package:dating/domain/state/dating/dating_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class DatingGridPage extends StatelessWidget {
  final int cid;
  const DatingGridPage({
    Key? key,
    required this.cid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatingState state = Provider.of<DatingState>(context);

    final List<GlobalKey<ImageSequenceAnimatorState>> heartAnimationKeyList = [];

    for (int i = 0; i < 13; i++) {
      heartAnimationKeyList.add(GlobalKey<ImageSequenceAnimatorState>());
    }
    Future.delayed(const Duration(milliseconds: 1200), () {
      state.getImages(cid);
    });

    return Container(
      width: 1.0.sw,
      height: 1.0.sh,
      color: Colors.black,
      child: Observer(
        builder: (_) {
          if (state.imagesLoaded && state.images != null) {
            return SafeArea(
              top: true,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 1.0.sw,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF6BC1FF),
                              Color(0xFFFF45A0),
                            ],
                          ),
                          border: Border.all(
                            width: 2.0,
                            color: NTheme.secondaryColor,
                          ),
                        ),
                        child: Text(
                          tr('dating.choose'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 1.0.sw,
                        height: 1.41.sw,
                        color: Colors.black,
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: 13,
                          mainAxisSpacing: 2.0,
                          crossAxisSpacing: 2.0,
                          itemBuilder: (BuildContext context, int index) => Stack(
                            children: <Widget>[
                              SizedBox(
                                width: index == state.randomItem ? 0.5.sw : 0.25.sw,
                                height: 1.41 * (index == state.randomItem ? 0.5.sw : 0.25.sw),
                                child: CachedNetworkImage(
                                  memCacheWidth: 1.0.sw.toInt(),
                                  memCacheHeight: 1.41.sw.toInt(),
                                  fit: BoxFit.fitWidth,
                                  placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.black,
                                    highlightColor: NTheme.secondaryColor,
                                    child: const ColoredBox(
                                      color: Colors.white,
                                    ),
                                  ),
                                  imageUrl:
                                      '${ApiConstant.imageUrl}${state.images![index]!.id}/${state.images![index]!.name}',
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  child: ImageSequenceAnimator(
                                    'assets/heart',
                                    'frame_',
                                    0,
                                    4,
                                    'png',
                                    30,
                                    key: heartAnimationKeyList[index],
                                    fps: 30,
                                    isAutoPlay: false,
                                    isLooping: false,
                                  ),
                                  onTap: () {
                                    if (state.previousIndex != index && state.countLikeGrid != 3) {
                                      bool exists = false;
                                      for (var element in state.chosen) {
                                        if (element['id'] == state.images![index]!.id) {
                                          element['weight']++;
                                          exists = true;
                                        }
                                      }
                                      if (!exists) {
                                        state.chosen.add(
                                          {
                                            'id': state.images![index]!.id,
                                            'data': state.images![index],
                                            'weight': 1,
                                          },
                                        );
                                      }
                                      heartAnimationKeyList[index].currentState!.play(from: 0.0);
                                      state.countLikeGrid++;
                                      state.previousIndex = index;
                                    }
                                    if (state.countLikeGrid == 3) {
                                      Future.delayed(const Duration(milliseconds: 1000), () {
                                        state.nextPage(cid + 1);
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          staggeredTileBuilder: (int index) {
                            if (index == state.randomItem) {
                              return const StaggeredTile.count(2, 2.82);
                            }
                            return const StaggeredTile.count(1, 1.41);
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding: EdgeInsets.only(top: 0.055.sw),
                      icon: const Icon(
                        Icons.replay,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        for (int i = 0; i < 13; i++) {
                          heartAnimationKeyList[i].currentState!.stop();
                        }
                        state.reloadImages(cid);
                      },
                      iconSize: 35,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(
            width: 1.0.sw,
            height: 1.0.sh,
            decoration: const BoxDecoration(color: Colors.black),
            child: Shimmer.fromColors(
              baseColor: NTheme.backgroundSecondaryColor,
              highlightColor: NTheme.secondaryColor,
              child: const ColoredBox(
                color: Colors.white,
              ),
              direction: ShimmerDirection.btt,
            ),
          );
        },
      ),
    );
  }
}
