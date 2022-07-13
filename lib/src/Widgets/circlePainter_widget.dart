import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double radius;

  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
              colors: [Color(0xff7919dc), Color(0xff3d1064)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
