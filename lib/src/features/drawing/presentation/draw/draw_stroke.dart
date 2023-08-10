import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/features/drawing/domain/stroke.dart';

class DrawStroke extends CustomPainter {
  final Stroke? stroke;
  final List<Offset> points;
  final Path? path;
  final BlendMode blendMode;
  final bool isAntiAlias;
  final double ratioScale;
  final ui.Image? pattern;

  const DrawStroke({
    this.stroke,
    required this.points,
    this.blendMode = BlendMode.srcOver,
    this.path,
    this.ratioScale = 1,
    this.isAntiAlias = false,
    this.pattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (stroke != null) {
      if (points.length > 1) {
        final paintStroke = Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round
          ..strokeWidth = stroke!.widthStroke * ratioScale
          ..blendMode = blendMode
          ..isAntiAlias = isAntiAlias
          ..shader = pattern != null
              ? ImageShader(
                  pattern!,
                  TileMode.repeated,
                  TileMode.repeated,
                  Matrix4.identity().scaled(0.6).storage,
                )
              : null;

        if (stroke!.color != Colors.transparent) {
          paintStroke.color = stroke!.color;
        }

        Offset point1 = points[0];
        Offset point2 = points[1];

        for (var i = 1, len = points.length - 1; i < len; i++) {
          canvas.drawLine(point1, point2, paintStroke);
          point1 = points[i];
          point2 = points[i + 1];
        }
      } else if (path != null) {
        final paintStrokePath = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke!.widthStroke * ratioScale
          ..color = stroke!.color
          ..blendMode = blendMode;

        canvas.drawPath(path!, paintStrokePath);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DrawStroke oldDelegate) =>
      stroke != oldDelegate.stroke ||
      points != oldDelegate.points ||
      blendMode != oldDelegate.blendMode ||
      isAntiAlias != oldDelegate.isAntiAlias ||
      ratioScale != oldDelegate.ratioScale ||
      pattern != oldDelegate.pattern;
}
