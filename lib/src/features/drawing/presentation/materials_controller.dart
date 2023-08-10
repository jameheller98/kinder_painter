import 'package:master_source_flutter/src/features/drawing/domain/material.dart';
import 'package:master_source_flutter/src/utils/canvas_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/draw_material.dart';
import 'package:master_source_flutter/src/features/drawing/application/drawing_service.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/paintbrush_controller.dart';

part 'materials_controller.g.dart';

@Riverpod(keepAlive: true)
class MaterialsController extends _$MaterialsController {
  @override
  Future<DrawMaterial> build() async {
    final materials =
        await ref.read(drawingServiceProvider.notifier).fetchMaterials();
    final listImagePattern = {};

    await Future.forEach(materials, (material) async {
      if (material.type == TypeMaterial.pattern) {
        await Future.forEach(material.patterns, (element) async {
          listImagePattern.addEntries({
            element.id: {
              "idMaterial": material.id,
              "image": await CanvasUtils.getImageUrl(
                  'https://app.rabbit.edu.vn/${element.pattern}'),
            },
          }.entries);
        });
      }
    });
    print(listImagePattern);
    return DrawMaterial(
      currentMaterial: materials[0],
      materials: [
        materials[0].copyWith(isActive: true),
        ...materials.skip(1).toList(),
      ],
    );
  }

  void handleChangeColor(int indexColorActive, final pageChangeReason) {
    state = AsyncData(
      state.value!.copyWith(
        currentMaterial: state.value!.currentMaterial
            .copyWith(indexDrawMaterialActive: indexColorActive),
        materials: state.value!.materials
            .map(
              (value) => value.id == state.value!.currentMaterial.id
                  ? value.copyWith(indexDrawMaterialActive: indexColorActive)
                  : value,
            )
            .toList(),
      ),
    );

    ref
        .read(paintbrushControllerProvider.notifier)
        .changePaintbrushByMaterial(state.value!.currentMaterial);
  }

  void handleChangeMaterial(Material material) {
    state = AsyncData(
      state.value!.copyWith(
        currentMaterial: material,
        materials: state.value!.materials
            .map(
              (value) => value.id == material.id
                  ? value.copyWith(isActive: true)
                  : value.copyWith(isActive: false),
            )
            .toList(),
      ),
    );

    ref
        .read(paintbrushControllerProvider.notifier)
        .changePaintbrushByMaterial(material);
  }
}
