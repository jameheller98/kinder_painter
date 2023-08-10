import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/features/drawing/domain/stroke.dart';

class DrawDot extends CustomPainter {
  final Stroke? stroke;
  final Offset point;
  final BlendMode blendMode;
  final bool isAntiAlias;
  final ui.Image? pattern;

  const DrawDot({
    required this.stroke,
    required this.point,
    required this.blendMode,
    this.isAntiAlias = false,
    this.pattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (stroke != null) {
      final paintDot = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = stroke!.widthStroke
        ..blendMode = blendMode
        ..isAntiAlias = isAntiAlias
        ..shader = pattern != null
            ? ImageShader(
                pattern!,
                TileMode.repeated,
                TileMode.repeated,
                Matrix4.identity().scaled(0.2).storage,
              )
            : null;

      if (stroke!.color != Colors.transparent) {
        paintDot.color = stroke!.color;
      }

      canvas.drawRect(
        Rect.fromLTWH(point.dx, point.dy, 1, 1),
        paintDot,
      );
    }
  }

  @override
  bool shouldRepaint(covariant DrawDot oldDelegate) =>
      stroke != oldDelegate.stroke ||
      point != oldDelegate.point ||
      blendMode != oldDelegate.blendMode ||
      isAntiAlias != oldDelegate.isAntiAlias ||
      pattern != oldDelegate.pattern;
}
