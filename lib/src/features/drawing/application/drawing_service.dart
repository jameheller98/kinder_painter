import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:master_source_flutter/src/utils/canvas_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:master_source_flutter/src/features/drawing/data/material_repository.dart';
import 'package:master_source_flutter/src/features/drawing/data/drawing_repository.dart';
import 'package:master_source_flutter/src/features/drawing/domain/material.dart'
    as material;
import 'package:master_source_flutter/src/features/drawing/domain/character_draw.dart';

part 'drawing_service.g.dart';

const uuid = Uuid();

@riverpod
class DrawingService extends _$DrawingService {
  @override
  void build() {}

  Future<CharacterDraw> fetchDrawingCharacter() {
    return ref.read(drawingRepositoryProvider).fetchCharacterDrawing();
  }

  Future<List<material.Material>> fetchMaterials() {
    return ref.read(materialRepositoryProvider).fetchMaterials();
  }

  Future<Map<String, ui.Image>?> fetchImagesCharacterPath(
      String idCharacter) async {
    final images =
        await ref.read(drawingRepositoryProvider).getImageCanvas(idCharacter);

    if (images != null) {
      final Map<String, ui.Image> parseImage = {};

      await Future.forEach(images.entries, (element) async {
        parseImage.addEntries({
          element.key: await CanvasUtils.bytesToImage(element.value),
        }.entries);
      });

      return parseImage;
    }

    return null;
  }

  Future<void> handleSaveImageCanvas(Map<String, dynamic>? data) async {
    try {
      if (data != null && data["fileImage"] != null) {
        final listImage = await fetchImagesCharacterPath(data["idImage"]);

        await Future.forEach(
            (data["fileImage"] as Map<String, Uint8List>).entries,
            (value) async {
          if (listImage != null && listImage[value.key] != null) {
            await ref.read(drawingRepositoryProvider).updateImageCanvas({
              "id_character": data["idImage"],
              "id_draw_path": value.key,
              "image": value.value,
            });
          } else {
            await ref.read(drawingRepositoryProvider).addImageCanvas({
              "id_character": data["idImage"],
              "id_draw_path": value.key,
              "image": value.value,
            });
          }
        });

        (data["fileImage"] as Map<String, Uint8List>).clear();
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
