import 'package:dating/presentation/screen/home/home_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: const <Widget>[
          HomeBottomBar(),
        ],
      ),
    );
  }
}
