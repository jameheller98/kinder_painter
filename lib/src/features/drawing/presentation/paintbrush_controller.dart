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
  Future<Paintbrush> build() async {
    final materialController =
        await ref.read(materialsControllerProvider.future);

    return Paintbrush(
      stroke: Stroke(
        color: materialController.currentMaterial.getColor,
      ),
    );
  }

  void changePaintbrushByMaterial(material.Material material) {
    switch (state.value!.type) {
      case TypePaintbrush.crayon:
      case TypePaintbrush.pencil:
      case TypePaintbrush.paintBrush:
      case TypePaintbrush.waterPen:
        state = AsyncData(
          state.value!.copyWith(
            stroke: state.value!.stroke!.copyWith(
              color: material.getColor,
            ),
          ),
        );
        break;
      case TypePaintbrush.waterPaint:
        state = AsyncData(
          state.value!.copyWith(
            fill: material.getColor,
          ),
        );
        break;
      case TypePaintbrush.eraser:
        break;
    }
  }

  void handleChangePaintbrush(TypePaintbrush type) async {
    final currentMaterial = await ref.read(
      materialsControllerProvider.selectAsync(
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
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: newPaintbrush.stroke!.copyWith(widthStroke: 6),
          ),
        );
        break;
      case TypePaintbrush.pencil:
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: newPaintbrush.stroke!.copyWith(widthStroke: 3),
            fill: null,
          ),
        );
        break;
      case TypePaintbrush.paintBrush:
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: newPaintbrush.stroke!.copyWith(widthStroke: 12),
            fill: null,
          ),
        );
        break;
      case TypePaintbrush.waterPen:
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: newPaintbrush.stroke!.copyWith(widthStroke: 8),
            fill: null,
          ),
        );
        break;
      case TypePaintbrush.waterPaint:
        state = AsyncData(
          newPaintbrush.copyWith(stroke: null),
        );
      case TypePaintbrush.eraser:
        state = AsyncData(
          newPaintbrush.copyWith(
            fill: null,
            stroke: null,
            blendMode: BlendMode.clear,
          ),
        );
        break;
    }
  }
}
