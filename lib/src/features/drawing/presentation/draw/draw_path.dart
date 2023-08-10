import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_dot.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_stroke.dart';

class DrawPath extends CustomPainter {
  final List<Offset> points;
  final Paintbrush paintbrush;
  final bool isAntiAlias;
  final ui.Image? pattern;

  const DrawPath({
    required this.points,
    required this.paintbrush,
    this.pattern,
    this.isAntiAlias = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isNotEmpty) {
      if (points.length > 1) {
        DrawStroke(
          stroke: paintbrush.stroke,
          points: points,
          blendMode: paintbrush.blendMode,
          pattern: pattern,
          isAntiAlias: isAntiAlias,
        ).paint(canvas, size);
      } else {
        DrawDot(
          stroke: paintbrush.stroke,
          point: points[0],
          blendMode: paintbrush.blendMode,
          pattern: pattern,
          isAntiAlias: isAntiAlias,
        ).paint(canvas, size);
      }
    }
  }

  @override
  bool shouldRepaint(DrawPath oldDelegate) =>
      points != oldDelegate.points ||
      paintbrush != oldDelegate.paintbrush ||
      isAntiAlias != oldDelegate.isAntiAlias ||
      pattern != oldDelegate.pattern;
}
