import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/features/drawing/domain/character_draw.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw_picture.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_fill.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_stroke.dart';

class DrawPainter extends CustomPainter {
  final CharacterDraw characterDraw;
  final Map<String, CharacterDrawPicture?> listPictureCharacterDrawPath;
  final double xSize;

  const DrawPainter({
    required this.characterDraw,
    required this.listPictureCharacterDrawPath,
    this.xSize = 1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(xSize, xSize);

    if (listPictureCharacterDrawPath["background"] != null) {
      canvas.drawPicture(listPictureCharacterDrawPath["background"]!.picture);
    } else if (characterDraw.backgroundDrawPaths.image == null) {
      DrawFill(
        fill: Colors.white,
        path: Path()..addRect(Rect.largest),
      ).paint(canvas, size);
    }

    for (final characterDrawPath in characterDraw.characterDrawPaths) {
      if (listPictureCharacterDrawPath[characterDrawPath.id] != null) {
        canvas.drawPicture(
            listPictureCharacterDrawPath[characterDrawPath.id]!.picture);
      } else if (characterDrawPath.fill != null &&
          characterDrawPath.image == null) {
        DrawFill(
          fill: characterDrawPath.fill!,
          path: characterDrawPath.characterPath,
        ).paint(canvas, size);
      }

      if (characterDrawPath.stroke != null) {
        DrawStroke(
          points: [],
          path: characterDrawPath.characterPath,
          stroke: characterDrawPath.stroke!,
          ratioScale: 1,
        ).paint(canvas, size);
      }
    }
  }

  @override
  bool shouldRepaint(DrawPainter oldDelegate) {
    return oldDelegate.characterDraw != characterDraw ||
        listPictureCharacterDrawPath !=
            oldDelegate.listPictureCharacterDrawPath;
  }
}
