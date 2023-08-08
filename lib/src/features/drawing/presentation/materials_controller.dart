import 'package:flutter/material.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/paintbrush_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/draw_material.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw_color.dart';
import 'package:master_source_flutter/src/features/drawing/domain/material.dart'
    as material;

part 'materials_controller.g.dart';

final arrColor = [
  Colors.black,
  Colors.red.shade300,
  Colors.yellow.shade300,
  Colors.blue.shade300,
  Colors.brown.shade300,
  Colors.green.shade300,
  Colors.pink.shade300,
  Colors.purple.shade300,
  Colors.grey.shade300,
  Colors.orange.shade300,
];
final materials = [
  material.Material(
    id: 1,
    type: material.TypeMaterial.color,
    indexDrawMaterialActive: 0,
    colors: arrColor
        .map(
          (color) => DrawColor(
            id: arrColor.indexOf(color) + 1,
            color: color,
          ),
        )
        .toList(),
  ),
];

@Riverpod(keepAlive: true)
class MaterialsController extends _$MaterialsController {
  @override
  DrawMaterial build() {
    return DrawMaterial(
      currentMaterial: materials[0],
      materials: materials,
    );
  }

  void handleChangeColor(int indexColorActive, final pageChangeReason) {
    state = state.copyWith(
      currentMaterial: state.currentMaterial
          .copyWith(indexDrawMaterialActive: indexColorActive),
    );

    ref
        .read(paintbrushControllerProvider.notifier)
        .changePaintbrushByMaterial(state.currentMaterial);
  }
}
