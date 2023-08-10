import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DrawImagePrevious extends CustomPainter {
  final ui.Image previousImage;

  const DrawImagePrevious({required this.previousImage});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(1 / 4, 1 / 4);
    canvas.drawImage(
      previousImage,
      Offset.zero,
      Paint(),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant DrawImagePrevious oldDelegate) {
    return previousImage != oldDelegate.previousImage;
  }
}
