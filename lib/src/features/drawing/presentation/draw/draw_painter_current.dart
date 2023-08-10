import 'package:flutter/material.dart';

import 'package:master_source_flutter/src/features/drawing/domain/character_draw.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw_picture.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart'
    as draw_path;
import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_eraser.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_fill.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_image_previous.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_path.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_stroke.dart';

class DrawPainterCurrent extends CustomPainter {
  final draw_path.DrawPath currentDrawPath;
  final CharacterDraw characterDraw;
  final Map<String, CharacterDrawPicture?> listPictureCharacterDrawPath;
  final Map<int, dynamic>? listImagePattern;

  const DrawPainterCurrent({
    required this.currentDrawPath,
    required this.characterDraw,
    required this.listPictureCharacterDrawPath,
    this.listImagePattern,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (currentDrawPath.paintbrush.type == TypePaintbrush.eraser) {
      DrawFill(
        fill: Colors.white,
        path: Path()..addRect(Rect.largest),
      ).paint(canvas, size);

      canvas.saveLayer(
        Offset.zero & size,
        Paint(),
      );
    }

    if (characterDraw.backgroundDrawPaths.image != null) {
      DrawImagePrevious(previousImage: characterDraw.backgroundDrawPaths.image!)
          .paint(canvas, size);
    }

    if (listPictureCharacterDrawPath["background"] != null) {
      canvas.drawPicture(listPictureCharacterDrawPath["background"]!.picture);
    } else {
      DrawFill(
        fill: Colors.white,
        path: Path()..addRect(Rect.largest),
      ).paint(canvas, size);
    }

    if (currentDrawPath.indexCharacterPath < 0) {
      if (currentDrawPath.paintbrush.type == TypePaintbrush.eraser) {
        DrawEraser(
          points: currentDrawPath.points,
        ).paint(canvas, size);
      } else {
        DrawPath(
          points: currentDrawPath.points,
          paintbrush: currentDrawPath.paintbrush,
          pattern: listImagePattern != null &&
                  currentDrawPath.paintbrush.idImagePattern != null
              ? listImagePattern![currentDrawPath.paintbrush.idImagePattern]
                  ["image"]
              : null,
        ).paint(canvas, size);
      }
    }

    if (currentDrawPath.paintbrush.type == TypePaintbrush.eraser) {
      canvas.restore();
    }

    for (int i = 0; i < characterDraw.characterDrawPaths.length; i++) {
      final characterDrawPath = characterDraw.characterDrawPaths[i];

      if (currentDrawPath.paintbrush.type == TypePaintbrush.eraser) {
        if (characterDrawPath.fill != null) {
          DrawFill(
            fill: characterDrawPath.fill!,
            path: characterDrawPath.characterPath,
          ).paint(canvas, size);
        }

        canvas.saveLayer(
          characterDrawPath.characterPath.getBounds(),
          Paint(),
        );
      }

      if (listPictureCharacterDrawPath[characterDrawPath.id] != null) {
        canvas.drawPicture(
            listPictureCharacterDrawPath[characterDrawPath.id]!.picture);
      } else if (characterDrawPath.fill != null &&
          currentDrawPath.paintbrush.type != TypePaintbrush.eraser) {
        DrawFill(
          fill: characterDrawPath.fill!,
          path: characterDrawPath.characterPath,
        ).paint(canvas, size);
      }

      if (currentDrawPath.paintbrush.type != TypePaintbrush.eraser) {
        canvas.save();
      }

      if (i == currentDrawPath.indexCharacterPath) {
        canvas.clipPath(characterDrawPath.characterPath);

        if (currentDrawPath.paintbrush.type == TypePaintbrush.eraser) {
          DrawEraser(
            points: currentDrawPath.points,
          ).paint(canvas, size);
        } else {
          DrawPath(
            points: currentDrawPath.points,
            paintbrush: currentDrawPath.paintbrush,
            pattern: listImagePattern != null &&
                    currentDrawPath.paintbrush.idImagePattern != null
                ? listImagePattern![currentDrawPath.paintbrush.idImagePattern]
                    ["image"]
                : null,
          ).paint(canvas, size);
        }
      }

      canvas.restore();

      if (characterDrawPath.stroke != null) {
        DrawStroke(
          points: [],
          path: characterDrawPath.characterPath,
          stroke: characterDrawPath.stroke!,
        ).paint(canvas, size);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DrawPainterCurrent oldDelegate) =>
      currentDrawPath != oldDelegate.currentDrawPath ||
      listPictureCharacterDrawPath !=
          oldDelegate.listPictureCharacterDrawPath ||
      characterDraw != oldDelegate.characterDraw ||
      listImagePattern != oldDelegate.listImagePattern;
}
