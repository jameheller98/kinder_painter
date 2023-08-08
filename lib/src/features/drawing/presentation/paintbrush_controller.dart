import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart';
import 'package:master_source_flutter/src/features/drawing/domain/stroke.dart';
import 'package:master_source_flutter/src/features/drawing/domain/material.dart'
    as material;
import 'package:master_source_flutter/src/features/drawing/presentation/materials_controller.dart';

part 'paintbrush_controller.g.dart';

@Riverpod(keepAlive: true)
class PaintbrushController extends _$PaintbrushController {
  @override
  Paintbrush build() {
    return const Paintbrush(stroke: Stroke());
  }

  void changePaintbrushByMaterial(material.Material material) {
    switch (state.type) {
      case TypePaintbrush.crayon:
      case TypePaintbrush.pencil:
      case TypePaintbrush.paintBrush:
      case TypePaintbrush.waterPen:
        state = state.copyWith(
          stroke: state.stroke!.copyWith(
            color: material.getColor,
          ),
        );
        break;
      case TypePaintbrush.waterPaint:
        state = state.copyWith(
          fill: material.getColor,
        );
        break;
      case TypePaintbrush.eraser:
        break;
    }
  }

  void handleChangePaintbrush(TypePaintbrush type) {
    final currentMaterial = ref.read(
      materialsControllerProvider.select(
        (value) => value.currentMaterial,
      ),
    );
    final newPaintbrush = Paintbrush(
      type: type,
      stroke: Stroke(
        color: currentMaterial.getColor,
      ),
      fill: currentMaterial.getColor,
    );

    switch (type) {
      case TypePaintbrush.crayon:
        state = newPaintbrush.copyWith(
          stroke: newPaintbrush.stroke!.copyWith(widthStroke: 6),
        );
        break;
      case TypePaintbrush.pencil:
        state = newPaintbrush.copyWith(
          stroke: newPaintbrush.stroke!.copyWith(widthStroke: 3),
          fill: null,
        );
        break;
      case TypePaintbrush.paintBrush:
        state = newPaintbrush.copyWith(
          stroke: newPaintbrush.stroke!.copyWith(widthStroke: 12),
          fill: null,
        );
        break;
      case TypePaintbrush.waterPen:
        state = newPaintbrush.copyWith(
          stroke: newPaintbrush.stroke!.copyWith(widthStroke: 8),
          fill: null,
        );
        break;
      case TypePaintbrush.waterPaint:
        state = newPaintbrush.copyWith(stroke: null);
      case TypePaintbrush.eraser:
        state = newPaintbrush.copyWith(
          fill: null,
          stroke: null,
          blendMode: BlendMode.clear,
        );
        break;
    }
  }
}
