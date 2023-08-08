import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_list_path.dart';

class DrawImageToSave extends CustomPainter {
  final Path characterPath;
  final List<DrawPath> drawPaths;

  const DrawImageToSave({
    required this.characterPath,
    required this.drawPaths,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      characterPath,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );
    canvas.clipPath(characterPath);
    canvas.saveLayer(Offset.zero & size, Paint());

    DrawListPath(
      drawPaths: drawPaths,
      characterPath: characterPath,
      isAntiAlias: true,
    ).paint(canvas, size);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant DrawImageToSave oldDelegate) =>
      characterPath != oldDelegate.characterPath ||
      drawPaths != oldDelegate.drawPaths;
}
