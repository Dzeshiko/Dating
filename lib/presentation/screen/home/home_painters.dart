import 'dart:math';

import 'package:flutter/material.dart';

class BottomBarBodyPainter extends CustomPainter {
  final BuildContext context;
  BottomBarBodyPainter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..lineTo((size.width / 2) - 35, 0)
      ..lineTo(size.width / 2, 0)
      ..lineTo((size.width / 2) + 35, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 65)
      ..lineTo(0, 65)
      ..lineTo(0, 0);
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.surface.withOpacity(0.7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BottomBarBorderPainter extends CustomPainter {
  BottomBarBorderPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path = Path()
      ..lineTo((size.width / 2) - 35, 0)
      ..lineTo(size.width / 2, 60)
      ..lineTo((size.width / 2) + 35, 0)
      ..lineTo(size.width, 0);

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..isAntiAlias = true;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BottomBarTrianglePainter extends CustomPainter {
  BottomBarTrianglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    double value = 60.0;
    double rotateValue = 0.0;
    double _width = value;
    double _height = sqrt(3) / 2 * value;
    double _angle = pi / 18 * rotateValue;
    double _radius = (2 * _height * sqrt(3)) / (3 * sqrt(3));
    double _shiftH = _height - (_radius - (_height / 2)) - 12;

    final path = Path()
      ..moveTo(_width / 2, 0)
      ..lineTo(_width, 0)
      ..lineTo(_width / 2, _height)
      ..lineTo(0, 0)
      ..lineTo(_width / 2, 0);

    const Gradient gradient = LinearGradient(
      colors: [
        Colors.yellow,
        Color(0xFF6BC1FF),
        Color(0xFFFF56AA),
        Colors.green,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final paint = Paint()
      ..shader = gradient.createShader(Rect.fromLTRB(
        0.0,
        0.0,
        value,
        value,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final double _r = sqrt(_width * _width + _shiftH * _shiftH) / 2;
    final _alpha = atan(_shiftH / _width);
    final _beta = _alpha + _angle;
    final _shiftY = _r * sin(_beta);
    final _shiftX = _r * cos(_beta);
    final _translateX = _width / 2 - _shiftX;
    final _translateY = _shiftH / 2 - _shiftY;

    canvas.translate(_translateX, _translateY);
    canvas.rotate(_angle);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
