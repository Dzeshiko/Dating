import 'package:align_positioned/align_positioned.dart';
import 'package:dating/data/constant/theme_constant.dart';
import 'package:dating/domain/state/dating/dating_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:provider/provider.dart';

class DatingFirstPage extends StatelessWidget {
  const DatingFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ImageSequenceAnimatorState> _manAnimationKey = GlobalKey<ImageSequenceAnimatorState>();
    GlobalKey<ImageSequenceAnimatorState> _womanAnimationKey = GlobalKey<ImageSequenceAnimatorState>();
    DatingState state = Provider.of<DatingState>(context);

    bool _checkGender = true;

    return Container(
      width: 1.0.sw,
      height: 1.0.sh,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/jpg/wall.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Observer(
        builder: (_) => Stack(
          children: <Widget>[
            AlignPositioned(
              alignment: Alignment.center,
              // dy: -20.0,
              child: SizedBox(
                width: 1.0.sw,
                child: const Image(
                  image: AssetImage('assets/png/dating_fp_bg.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              width: 1.0.sw,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              // height: 0.06.sh,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6BC1FF),
                    Color(0xFFFF45A0),
                  ],
                ),
              ),
              child: Text(
                tr('dating.title'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Pattaya",
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: (1.0.sh - 0.9.sw) / 2,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
//** Man Tab */
                          Container(
                            width: 0.3.sw,
                            height: 0.12.sw,
                            margin: EdgeInsets.only(left: 0.1.sw),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: NTheme.secondaryColor,
                              ),
                              color: NTheme.surfaceColor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (_checkGender) {
                                  _manAnimationKey.currentState!.play(from: 1.0);
                                  _checkGender = false;
                                  Future.delayed(const Duration(milliseconds: 1000), () {
                                    state.nextPage(1);
                                  });
                                }
                              },
                              child: Center(
                                child: Text(
                                  tr('dating.tabs.man').toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: "UbuntuRegular",
                                    fontSize: 16.0,
                                    color: NTheme.secondaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
//** Woman Tab */
                          Container(
                            width: 0.3.sw,
                            height: 0.12.sw,
                            margin: EdgeInsets.only(right: 0.1.sw),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: NTheme.primaryColor,
                              ),
                              color: NTheme.surfaceColor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (_checkGender) {
                                  _womanAnimationKey.currentState!.play(from: 1.0);
                                  _checkGender = false;
                                  Future.delayed(const Duration(milliseconds: 1000), () {
                                    state.nextPage(1);
                                  });
                                }
                              },
                              child: Center(
                                child: Text(
                                  tr('dating.tabs.woman').toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: "UbuntuRegular",
                                    fontSize: 16.0,
                                    color: NTheme.primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
//** Man Check */
                      SizedBox(
                        width: 0.4.sw,
                        child: ImageSequenceAnimator(
                          'assets/boy_small',
                          'frame_',
                          0,
                          4,
                          'png',
                          36,
                          key: _manAnimationKey,
                          fps: 36,
                          isAutoPlay: true,
                          isLooping: false,
                        ),
                      ),
//** Woman Check */
                      SizedBox(
                        width: 0.4.sw,
                        child: ImageSequenceAnimator(
                          'assets/girl_small',
                          'frame_',
                          0,
                          4,
                          'png',
                          36,
                          key: _womanAnimationKey,
                          fps: 36,
                          isAutoPlay: false,
                          isLooping: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
