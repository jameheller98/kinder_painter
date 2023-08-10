import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DrawFill extends CustomPainter {
  final Color fill;
  final Path path;
  final bool isAntiAlias;
  final ui.Image? pattern;

  const DrawFill({
    required this.fill,
    required this.path,
    this.isAntiAlias = false,
    this.pattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintFill = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = isAntiAlias
      ..shader = pattern != null
          ? ImageShader(
              pattern!,
              TileMode.repeated,
              TileMode.repeated,
              Matrix4.identity().scaled(0.6).storage,
            )
          : null;

    if (fill != Colors.transparent) {
      paintFill.color = fill;
    }

    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant DrawFill oldDelegate) =>
      fill != oldDelegate.fill ||
      path != oldDelegate.path ||
      isAntiAlias != oldDelegate.isAntiAlias;
}
