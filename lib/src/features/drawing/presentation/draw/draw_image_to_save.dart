import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_image_previous.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_list_path.dart';

class DrawImageToSave extends CustomPainter {
  final Path characterPath;
  final List<DrawPath> drawPaths;
  final ui.Image? previousImage;
  final Map<int, dynamic>? listImagePattern;
  final double xSize;
  final bool isAntiAlias;

  const DrawImageToSave({
    required this.characterPath,
    required this.drawPaths,
    required this.xSize,
    this.listImagePattern,
    this.previousImage,
    required this.isAntiAlias,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(xSize, xSize);
    canvas.drawPath(
      characterPath,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );
    canvas.clipPath(characterPath);
    canvas.saveLayer(Offset.zero & size, Paint());

    if (previousImage != null) {
      DrawImagePrevious(
        previousImage: previousImage!,
        isAntiAlias: isAntiAlias,
      ).paint(canvas, size);
    }

    DrawListPath(
      drawPaths: drawPaths,
      characterPath: characterPath,
      isAntiAlias: isAntiAlias,
      listImagePattern: listImagePattern,
    ).paint(canvas, size);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant DrawImageToSave oldDelegate) =>
      characterPath != oldDelegate.characterPath ||
      drawPaths != oldDelegate.drawPaths;
}
