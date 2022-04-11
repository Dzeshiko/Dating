import 'dart:math';

import 'package:align_positioned/align_positioned.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:animated_text/animated_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

class DatingLastPage extends StatefulWidget {
  const DatingLastPage({Key? key}) : super(key: key);

  @override
  _DatingLastPageState createState() => _DatingLastPageState();
}

class _DatingLastPageState extends State<DatingLastPage> with TickerProviderStateMixin {
  AnimationController? _controllerLittleHearts;
  Animation<double>? _animationMiniHearts;

  AnimationController? _controllerCurtains;
  Animation<double>? _animationCurtains;

  AnimationController? _controllerNumber;
  Animation<double>? _animationNumber;

  @override
  void initState() {
    _controllerLittleHearts = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animationMiniHearts = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controllerLittleHearts!,
        curve: Curves.linear,
      ),
    );
    _controllerCurtains = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animationCurtains = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerCurtains!,
        curve: Curves.linear,
      ),
    );

    _controllerNumber = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animationNumber = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerNumber!,
        curve: Curves.linear,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controllerLittleHearts?.dispose();
    _controllerCurtains?.dispose();
    _controllerNumber?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ImageSequenceAnimatorState> _curtainAnimationKey = GlobalKey<ImageSequenceAnimatorState>();

    Future.delayed(const Duration(milliseconds: 1500), () {
      _controllerLittleHearts!.forward();
    });

    Random random = Random();

    return SafeArea(
      child: Container(
        width: 1.0.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/jpg/wall.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
//eiffel tower
            const AlignPositioned(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/png/dating_fp_bg.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              children: <Widget>[
//gradient top
                Container(
                  width: 1.0.sw,
                  height: 0.35.sw,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 75, 75, 75)],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.25.sw,
                ),
//gradient bottom
                Container(
                  width: 1.0.sw,
                  height: 0.35.sw,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 75, 75, 75),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedText(
                      alignment: Alignment.center,
                      speed: const Duration(milliseconds: 1500),
                      controller: AnimatedTextController.play,
                      displayTime: const Duration(milliseconds: 800),
                      repeatCount: 1,
                      wordList: [tr('dating.max'), tr('dating.coincidence')],
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 51, 255, 255),
                        fontSize: 40,
                        fontFamily: "Pattaya",
                      ),
                      onFinished: () {
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          _controllerCurtains!.forward();
                        });
                        Future.delayed(const Duration(milliseconds: 5000), () {
                          _curtainAnimationKey.currentState!.play(from: 1.0);
                        });
                        Future.delayed(const Duration(milliseconds: 6500), () {
                          _controllerNumber!.forward();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
//mini hearts
            AlignPositioned(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 0.55.sw,
                child: FadeTransition(
                  opacity: _animationMiniHearts!,
                  child: const Image(
                    image: AssetImage('assets/gif/mini_hearts.gif'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),

//curtains
            AlignPositioned(
              moveVerticallyByChildWidth: 0.6,
              child: FadeTransition(
                opacity: _animationCurtains!,
                child: SizedBox(
                  width: 0.59.sw,
                  child: ImageSequenceAnimator(
                    'assets/curtains',
                    'frame_',
                    0,
                    4,
                    'png',
                    7,
                    key: _curtainAnimationKey,
                    fps: 3,
                    isAutoPlay: true,
                    isLooping: false,
                    // onFinishPlaying: (_) {

                    // },
                  ),
                ),
              ),
            ),
            AlignPositioned(
              moveVerticallyByChildWidth: 0.6,
              child: FadeTransition(
                opacity: _animationNumber!,
                child: SizedBox(
                  width: 0.59.sw,
                  child: Text(
                    " ${random.nextInt(101)} ",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 51, 255, 255),
                      fontSize: 50,
                      backgroundColor: Colors.black87,
                      fontFamily: "Pattaya",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
