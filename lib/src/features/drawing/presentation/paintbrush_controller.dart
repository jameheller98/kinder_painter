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
      stroke: materialController.currentMaterial.getColor != null
          ? Stroke(
              color: materialController.currentMaterial.getColor!,
            )
          : null,
    );
  }

  void changePaintbrushByMaterial(material.Material currentMaterial) {
    buildTypePaintBrush(state.value!.type, currentMaterial);
  }

  void handleChangePaintbrush(TypePaintbrush type) async {
    final currentMaterial = await ref.read(
      materialsControllerProvider.selectAsync(
        (value) => value.currentMaterial,
      ),
    );

    buildTypePaintBrush(type, currentMaterial);
  }

  void buildTypePaintBrush(
      TypePaintbrush type, material.Material currentMaterial) {
    final newPaintbrush = Paintbrush(
      type: type,
      stroke: Stroke(
        color: currentMaterial.getColor != null
            ? currentMaterial.getColor!
            : Colors.transparent,
      ),
      fill: currentMaterial.getColor != null
          ? currentMaterial.getColor!
          : Colors.transparent,
      idImagePattern: currentMaterial.patterns.isNotEmpty
          ? currentMaterial.patterns
              .elementAt(currentMaterial.indexDrawMaterialActive)
              .id
          : null,
    );

    switch (type) {
      case TypePaintbrush.crayon:
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: newPaintbrush.stroke?.copyWith(widthStroke: 6),
            fill: null,
          ),
        );
        break;
      case TypePaintbrush.pencil:
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: newPaintbrush.stroke?.copyWith(widthStroke: 3),
            fill: null,
          ),
        );
        break;
      case TypePaintbrush.paintBrush:
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: newPaintbrush.stroke?.copyWith(widthStroke: 12),
            fill: null,
          ),
        );
        break;
      case TypePaintbrush.waterPen:
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: newPaintbrush.stroke?.copyWith(widthStroke: 8),
            fill: null,
          ),
        );
        break;
      case TypePaintbrush.waterPaint:
        state = AsyncData(
          newPaintbrush.copyWith(
            stroke: null,
          ),
        );
      case TypePaintbrush.eraser:
        state = AsyncData(
          newPaintbrush.copyWith(
            fill: null,
            stroke: null,
            idImagePattern: null,
            blendMode: BlendMode.clear,
          ),
        );
        break;
    }
  }
}
