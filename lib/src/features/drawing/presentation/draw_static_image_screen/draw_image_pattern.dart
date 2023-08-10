import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class DrawImagePattern extends StatelessWidget {
  final ui.Image pattern;
  final Size size;

  const DrawImagePattern(
      {super.key, required this.pattern, this.size = const Size(100, 100)});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: size,
        painter: DrawPattern(
          pattern: pattern,
        ),
      ),
    );
  }
}

class DrawPattern extends CustomPainter {
  final ui.Image? pattern;

  const DrawPattern({
    this.pattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintPattern = Paint()
      ..shader = pattern != null
          ? ImageShader(
              pattern!,
              TileMode.repeated,
              TileMode.repeated,
              Matrix4.identity().scaled(0.4).storage,
            )
          : null;

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      paintPattern,
    );
  }

  @override
  bool shouldRepaint(covariant DrawPattern oldDelegate) =>
      pattern != oldDelegate.pattern;
}
