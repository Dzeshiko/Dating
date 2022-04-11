import 'package:align_positioned/align_positioned.dart';
import 'package:dating/presentation/screen/home/home_painters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: _size.width,
        height: 65.0,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: _size.width,
                height: 65.0,
                child: CustomPaint(
                  size: Size(_size.width, 65.0),
                  painter: BottomBarBodyPainter(context: context),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: _size.width,
                height: 65.0,
                child: Observer(
                  builder: (_) {
                    return CustomPaint(
                      size: Size(_size.width, 65.0),
                      foregroundPainter: BottomBarBorderPainter(),
                      painter: null,
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 60.0,
                height: 65.0,
                child: CustomPaint(
                  painter: BottomBarTrianglePainter(),
                ),
              ),
            ),
            const AlignPositioned(
              alignment: Alignment.bottomCenter,
              dy: -32.5,
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: Image(
                  image: AssetImage('assets/png/navigator.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
