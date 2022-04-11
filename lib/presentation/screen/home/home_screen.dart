import 'package:dating/presentation/screen/dating/dating_screen.dart';
import 'package:dating/presentation/screen/home/home_navigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        SizedBox.expand(
          child: DatingScreen(),
        ),
        Positioned(
          top: 40.0,
          left: 30.0,
          child: SizedBox(
            width: 48.0,
            child: Image(image: AssetImage('assets/png/heart_border.png')),
          ),
        ),
        Positioned(
          top: 44.5,
          left: 34.5,
          child: SizedBox(
            width: 40.0,
            child: Image(image: AssetImage('assets/png/heart_fill.png')),
          ),
        ),
        HomeNavigation(),
      ],
    );
  }
}
