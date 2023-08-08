import 'package:flutter/material.dart';

class DrawEraser extends CustomPainter {
  final List<Offset> points;

  const DrawEraser({
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length > 1) {
      final paintEraser = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = 20
        ..blendMode = BlendMode.clear;

      Offset point1 = points[0];
      Offset point2 = points[1];

      for (var i = 1, len = points.length - 1; i < len; i++) {
        canvas.drawLine(point1, point2, paintEraser);
        point1 = points[i];
        point2 = points[i + 1];
      }
    }
  }

  @override
  bool shouldRepaint(covariant DrawEraser oldDelegate) =>
      points != oldDelegate.points;
}
