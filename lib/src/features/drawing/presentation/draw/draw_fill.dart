import 'package:flutter/material.dart';

class DrawFill extends CustomPainter {
  final Color fill;
  final Path path;
  final bool isAntiAlias;

  const DrawFill({
    required this.fill,
    required this.path,
    this.isAntiAlias = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = fill
      ..isAntiAlias = isAntiAlias;

    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant DrawFill oldDelegate) =>
      fill != oldDelegate.fill ||
      path != oldDelegate.path ||
      isAntiAlias != oldDelegate.isAntiAlias;
}
