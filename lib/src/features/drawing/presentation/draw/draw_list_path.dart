import 'package:flutter/material.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart';
import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_eraser.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_fill.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_path.dart'
    as draw_path;

class DrawListPath extends CustomPainter {
  final List<DrawPath> drawPaths;
  final Path? characterPath;
  final bool isAntiAlias;
  final Map<int, dynamic>? listImagePattern;

  const DrawListPath({
    required this.drawPaths,
    this.characterPath,
    this.isAntiAlias = false,
    this.listImagePattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final drawPath in drawPaths) {
      if (drawPath.paintbrush.type == TypePaintbrush.eraser) {
        DrawEraser(points: drawPath.points).paint(canvas, size);
      } else if (drawPath.paintbrush.type == TypePaintbrush.waterPaint &&
          characterPath != null) {
        DrawFill(
          fill: drawPath.paintbrush.fill!,
          path: characterPath!,
          isAntiAlias: isAntiAlias,
          pattern: listImagePattern != null &&
                  drawPath.paintbrush.idImagePattern != null
              ? listImagePattern![drawPath.paintbrush.idImagePattern]["image"]
              : null,
        ).paint(canvas, size);
      } else {
        draw_path.DrawPath(
          points: drawPath.points,
          paintbrush: drawPath.paintbrush,
          pattern: listImagePattern != null &&
                  drawPath.paintbrush.idImagePattern != null
              ? listImagePattern![drawPath.paintbrush.idImagePattern]["image"]
              : null,
          isAntiAlias: isAntiAlias,
        ).paint(canvas, size);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DrawListPath oldDelegate) =>
      drawPaths != oldDelegate.drawPaths ||
      characterPath != oldDelegate.characterPath ||
      isAntiAlias != oldDelegate.isAntiAlias ||
      listImagePattern != oldDelegate.listImagePattern;
}
