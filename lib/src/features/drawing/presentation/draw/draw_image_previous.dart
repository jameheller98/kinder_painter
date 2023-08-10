import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DrawImagePrevious extends CustomPainter {
  final ui.Image previousImage;
  final bool isAntiAlias;

  const DrawImagePrevious({
    required this.previousImage,
    this.isAntiAlias = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(1 / 1.5, 1 / 1.5);
    canvas.drawImage(
      previousImage,
      Offset.zero,
      Paint()..isAntiAlias = isAntiAlias,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant DrawImagePrevious oldDelegate) {
    return previousImage != oldDelegate.previousImage;
  }
}
