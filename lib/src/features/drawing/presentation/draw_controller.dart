import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_source_flutter/src/common_widgets/common/loading_overlay.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/materials_controller.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/constants/stack.dart' as stack;
import 'package:master_source_flutter/src/features/drawing/application/drawing_service.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw_path.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_painter.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw_picture.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart';
import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_image_to_save.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/paintbrush_controller.dart';
import 'package:master_source_flutter/src/utils/canvas_utils.dart';

part 'draw_controller.g.dart';

var uuid = const Uuid();

enum TypeModifiedPath { undo, redo }

enum ModeToolLeft { material, brush, idle }

enum ModeToolRight { move, reset }

@riverpod
class DrawController extends _$DrawController {
  static Map<String, CharacterDrawPicture> listPictureCharacterDrawPath = {};

  @override
  Future<Draw> build() async {
    return _handleInitDraw();
  }

  void handleTouchStart(DragStartDetails details) {
    if (state.value!.isDrawing) return;

    final paintbrush = ref.read(paintbrushControllerProvider);
    final lastIndexDrawPaths =
        state.value!.characterDraw.characterDrawPaths.lastIndexWhere(
      (characterDrawPath) => characterDrawPath.characterPath.contains(
        details.localPosition,
      ),
    );

    if (paintbrush.value!.type == TypePaintbrush.waterPaint &&
        (state.value!.characterDraw
                    .lastDrawPathOfCharacter(lastIndexDrawPaths)
                    ?.paintbrush
                    .fill ==
                paintbrush.value!.fill &&
            state.value!.characterDraw
                    .lastDrawPathOfCharacter(lastIndexDrawPaths)
                    ?.paintbrush
                    .idImagePattern ==
                paintbrush.value!.idImagePattern)) {
      return;
    }

    final currentDrawPath = DrawPath(
      id: uuid.v4(),
      indexCharacterPath: lastIndexDrawPaths,
      paintbrush: paintbrush.value!,
      points: [details.localPosition],
    );

    state = AsyncData(state.value!.copyWith(
      isDrawing: paintbrush.value!.type != TypePaintbrush.waterPaint,
      currentDrawPath: currentDrawPath,
    ));
  }

  void handleTouchMove(DragUpdateDetails details) {
    // final paintbrush = ref.read(paintbrushControllerProvider);

    if (!state.value!.isDrawing || state.value!.currentDrawPath == null) {
      return;
    }

    double dx = (details.localPosition.dx -
            state.value!.currentDrawPath!.points.last.dx)
        .abs();
    double dy = (details.localPosition.dy -
            state.value!.currentDrawPath!.points.last.dy)
        .abs();

    if (dx >= CanvasUtils.touchTolerance || dy >= CanvasUtils.touchTolerance) {
      state = AsyncData(state.value!.copyWith(
        currentDrawPath: state.value!.currentDrawPath!.copyWith(
          points: [
            ...state.value!.currentDrawPath!.points,
            details.localPosition,
          ],
        ),
      ));
    }
  }

  void handleTouchEnd(DragEndDetails details) {
    if (state.value!.currentDrawPath == null) return;

    _handlePushUndoDrewPathStack(
      state.value!.currentDrawPath!,
    );

    if (state.value!.currentDrawPath!.indexCharacterPath >= 0) {
      _handleAddNewDrawPathToCharacterPath();
    } else {
      _handleAddNewDrawPathToBackground();
    }
  }

  void handleUndoPath() {
    late stack.Stack<DrawPath> undidPathStack;
    final stack.Stack<DrawPath> drewPathStack =
        state.value!.drewPathStack!.copyWith();

    if (state.value!.undidPathStack == null) {
      undidPathStack = stack.Stack<DrawPath>([]);
    } else {
      undidPathStack = state.value!.undidPathStack!.copyWith();
    }

    final drewPathCurrent = drewPathStack.pop();
    final indexDrewPathCurrent = drewPathCurrent.indexCharacterPath;
    final characterDrawPath = indexDrewPathCurrent >= 0
        ? state.value!.characterDraw.characterDrawPaths[indexDrewPathCurrent]
        : null;
    final backgroundDrawPath = indexDrewPathCurrent < 0
        ? state.value!.characterDraw.backgroundDrawPaths.copyWith()
        : null;
    final newDrawPath = indexDrewPathCurrent >= 0
        ? characterDrawPath!.drawPaths
            .where(
              (drawPath) => drawPath.id != drewPathCurrent.id,
            )
            .toList()
        : backgroundDrawPath!.drawPaths
            .where(
              (drawPath) => drawPath.id != drewPathCurrent.id,
            )
            .toList();
    final rectPath = Path()..addRect(Rect.largest);

    handleConvertImage(
      characterPath: indexDrewPathCurrent >= 0
          ? characterDrawPath!.characterPath
          : rectPath,
      drawPaths: newDrawPath,
      idCharacterDrawPath:
          indexDrewPathCurrent >= 0 ? characterDrawPath!.id : "background",
      previousImage: indexDrewPathCurrent >= 0
          ? characterDrawPath!.image
          : backgroundDrawPath!.image,
    );

    undidPathStack.push(drewPathCurrent);

    state = AsyncData(
      state.value!.copyWith(
        drewPathStack: drewPathStack.isEmpty ? null : drewPathStack,
        undidPathStack: undidPathStack,
        characterDraw: state.value!.characterDraw.copyWith(
          characterDrawPaths: indexDrewPathCurrent >= 0
              ? state.value!.characterDraw.characterDrawPaths
                  .map(
                    (characterDrawPath) => state
                                .value!.characterDraw.characterDrawPaths
                                .indexOf(characterDrawPath) ==
                            indexDrewPathCurrent
                        ? characterDrawPath.copyWith(
                            drawPaths: newDrawPath,
                          )
                        : characterDrawPath,
                  )
                  .toList()
              : state.value!.characterDraw.characterDrawPaths,
          backgroundDrawPaths: indexDrewPathCurrent < 0
              ? state.value!.characterDraw.backgroundDrawPaths.copyWith(
                  drawPaths: newDrawPath,
                )
              : state.value!.characterDraw.backgroundDrawPaths,
        ),
      ),
    );
  }

  void handleRedoPath() {
    late stack.Stack<DrawPath> drewPathStack;
    final stack.Stack<DrawPath> undidPathStack =
        state.value!.undidPathStack!.copyWith();

    if (state.value!.drewPathStack == null) {
      drewPathStack = stack.Stack<DrawPath>([]);
    } else {
      drewPathStack = state.value!.drewPathStack!.copyWith();
    }

    final undidPathCurrent = undidPathStack.pop();
    final indexUndidPathCurrent = undidPathCurrent.indexCharacterPath;
    final characterDrawPath = indexUndidPathCurrent >= 0
        ? state.value!.characterDraw.characterDrawPaths[indexUndidPathCurrent]
        : null;
    final backgroundDrawPath = indexUndidPathCurrent < 0
        ? state.value!.characterDraw.backgroundDrawPaths.copyWith()
        : null;
    final newDrawPath = indexUndidPathCurrent >= 0
        ? [...characterDrawPath!.drawPaths, undidPathCurrent]
        : [...backgroundDrawPath!.drawPaths, undidPathCurrent];
    final rectPath = Path()..addRect(Rect.largest);

    handleConvertImage(
      characterPath: indexUndidPathCurrent >= 0
          ? characterDrawPath!.characterPath
          : rectPath,
      drawPaths: newDrawPath,
      idCharacterDrawPath:
          indexUndidPathCurrent >= 0 ? characterDrawPath!.id : "background",
      previousImage: indexUndidPathCurrent >= 0
          ? characterDrawPath!.image
          : backgroundDrawPath!.image,
    );

    drewPathStack.push(undidPathCurrent);

    state = AsyncData(
      state.value!.copyWith(
        drewPathStack: drewPathStack,
        undidPathStack: undidPathStack.isEmpty ? null : undidPathStack,
        characterDraw: state.value!.characterDraw.copyWith(
          characterDrawPaths: indexUndidPathCurrent >= 0
              ? state.value!.characterDraw.characterDrawPaths
                  .map(
                    (characterDrawPath) => state
                                .value!.characterDraw.characterDrawPaths
                                .indexOf(characterDrawPath) ==
                            indexUndidPathCurrent
                        ? characterDrawPath.copyWith(
                            drawPaths: newDrawPath,
                          )
                        : characterDrawPath,
                  )
                  .toList()
              : state.value!.characterDraw.characterDrawPaths,
          backgroundDrawPaths: indexUndidPathCurrent < 0
              ? state.value!.characterDraw.backgroundDrawPaths.copyWith(
                  drawPaths: newDrawPath,
                )
              : state.value!.characterDraw.backgroundDrawPaths,
        ),
      ),
    );
  }

  ui.Picture canvasToPicture({
    required Path characterPath,
    required List<DrawPath> drawPaths,
    ui.Image? previousImage,
    double xSize = 1,
    isAntiAlias = true,
  }) {
    final listImagePatternAsync = ref.read(
      materialsControllerProvider
          .select((value) => AsyncData(value.value?.listImagePattern)),
    );
    final Size sizeCanvas = ref.read(sizeCanvasProvider);
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    DrawImageToSave drawPainter = DrawImageToSave(
      characterPath: characterPath,
      drawPaths: drawPaths,
      previousImage: previousImage,
      listImagePattern: listImagePatternAsync.value,
      isAntiAlias: isAntiAlias,
      xSize: xSize,
    );
    drawPainter.paint(canvas, sizeCanvas * xSize);
    return recorder.endRecording();
  }

  void handleConvertImage({
    required Path characterPath,
    required List<DrawPath> drawPaths,
    required String idCharacterDrawPath,
    ui.Image? previousImage,
  }) {
    final ui.Picture pictureDrawPath = canvasToPicture(
      characterPath: characterPath,
      drawPaths: drawPaths,
      previousImage: previousImage,
      isAntiAlias: false,
    );

    if (listPictureCharacterDrawPath[idCharacterDrawPath] != null) {
      listPictureCharacterDrawPath[idCharacterDrawPath]!.picture.dispose();
    }

    listPictureCharacterDrawPath.addEntries(
      {
        idCharacterDrawPath: CharacterDrawPicture(
          picture: pictureDrawPath,
          idCharacterDrawPath: idCharacterDrawPath,
        ),
      }.entries,
    );
  }

  Future<Map<String, dynamic>?> handleSaveImage(BuildContext context) async {
    LoadingOverlay.of(context).show();

    ui.Picture? picture;
    ui.Image? image;

    try {
      final Size sizeCanvas = ref.read(sizeCanvasProvider);

      ui.PictureRecorder recorder = ui.PictureRecorder();
      Canvas canvas = Canvas(recorder);

      final drawPainter = DrawPainter(
        characterDraw: state.value!.characterDraw,
        listPictureCharacterDrawPath: listPictureCharacterDrawPath,
        xSize: 1.5,
      );

      drawPainter.paint(canvas, sizeCanvas * 1.5);
      picture = recorder.endRecording();
      image = await picture.toImage(
        (sizeCanvas.width * 1.5).floor(),
        (sizeCanvas.height * 1.5).floor(),
      );

      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

      if (bytes != null) {
        final fileImage = await _handleSaveCharacterPath();

        await ref.read(drawingServiceProvider.notifier).handleSaveImageCanvas({
          "fileImage": fileImage,
          "mainImage": bytes.buffer.asUint8List(),
          "idImage": state.value!.characterDraw.id,
        });

        _handleClearPictureAndImage();

        final initDraw = await _handleInitDraw();

        state = AsyncData(initDraw);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (picture != null) {
        picture.dispose();
      }

      if (image != null) {
        image.dispose();
      }

      LoadingOverlay.of(context).hide();
    }

    return null;
  }

  Future<Map<String, Uint8List>?> _handleSaveCharacterPath() async {
    if (listPictureCharacterDrawPath.isEmpty) return null;

    final Size sizeCanvas = ref.read(sizeCanvasProvider);
    final Map<String, dynamic> arrTemp = {};
    final Map<String, Uint8List> data = {};

    listPictureCharacterDrawPath.forEach((key, value) {
      if (key == "background") {
        arrTemp.addEntries({
          "background": {
            "characterPath": Path()..addRect(Rect.largest),
            "drawPaths":
                state.value!.characterDraw.backgroundDrawPaths.drawPaths,
            "previousImage":
                state.value!.characterDraw.backgroundDrawPaths.image,
          },
        }.entries);
      } else {
        final currentCharacterDrawPaths =
            state.value!.characterDraw.characterDrawPaths.firstWhere(
          (element) => element.id == key,
          orElse: () => CharacterDrawPath(
            id: '0',
            characterPath: Path(),
          ),
        );
        if (currentCharacterDrawPaths.id != '0') {
          arrTemp.addEntries({
            key: {
              "characterPath": currentCharacterDrawPaths.characterPath,
              "drawPaths": currentCharacterDrawPaths.drawPaths,
              "previousImage": currentCharacterDrawPaths.image,
            },
          }.entries);
        }
      }
    });

    await Future.forEach(arrTemp.entries, (element) async {
      ui.Image? image;
      ui.Picture? picture;
      try {
        picture = canvasToPicture(
          characterPath: element.value["characterPath"],
          drawPaths: element.value["drawPaths"],
          previousImage: element.value["previousImage"],
          xSize: 1.5,
        );
        image = await picture.toImage(
          (sizeCanvas.width * 1.5).floor(),
          (sizeCanvas.height * 1.5).floor(),
        );

        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

        if (bytes != null) {
          data.addEntries({element.key: bytes.buffer.asUint8List()}.entries);
        }
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        if (picture != null) {
          picture.dispose();
        }
        if (image != null) {
          image.dispose();
        }
      }
    });

    arrTemp.clear();

    return data;
  }

  Future<Draw> _handleInitDraw() async {
    final characterDraw =
        await ref.read(drawingServiceProvider.notifier).fetchDrawingCharacter();
    final images = await ref
        .read(drawingServiceProvider.notifier)
        .fetchImagesCharacterPath(characterDraw.id);

    final initDraw = Draw(
      characterDraw: characterDraw.copyWith(
        backgroundDrawPaths: characterDraw.backgroundDrawPaths.copyWith(
          image: images != null && images["background"] != null
              ? images["background"]
              : null,
        ),
        characterDrawPaths: characterDraw.characterDrawPaths.map((e) {
          return images != null ? e.copyWith(image: images[e.id]) : e;
        }).toList(),
      ),
    );

    if (initDraw.characterDraw.backgroundDrawPaths.image != null) {
      handleConvertImage(
        characterPath: Path()..addRect(Rect.largest),
        drawPaths: [],
        idCharacterDrawPath: "background",
        previousImage: initDraw.characterDraw.backgroundDrawPaths.image,
      );
    }

    initDraw.characterDraw.characterDrawPaths.forEach((element) {
      if (element.image != null) {
        handleConvertImage(
          characterPath: element.characterPath,
          drawPaths: [],
          idCharacterDrawPath: element.id,
          previousImage: element.image,
        );
      }
    });

    return initDraw;
  }

  void _handleClearPictureAndImage() {
    if (listPictureCharacterDrawPath.isNotEmpty) {
      listPictureCharacterDrawPath.entries.forEach((element) {
        element.value.picture.dispose();
      });

      listPictureCharacterDrawPath.clear();
    }

    if (state.value!.characterDraw.backgroundDrawPaths.image != null) {
      state.value!.characterDraw.backgroundDrawPaths.image!.dispose();
    }

    state.value!.characterDraw.characterDrawPaths.forEach((element) {
      if (element.image != null) {
        element.image!.dispose();
      }
    });
  }

  void _handleAddNewDrawPathToCharacterPath() {
    final newCharacterDrawPath = state.value!.characterDraw
        .characterDrawPaths[state.value!.currentDrawPath!.indexCharacterPath]
        .copyWith(
      drawPaths: [
        ...state
            .value!
            .characterDraw
            .characterDrawPaths[
                state.value!.currentDrawPath!.indexCharacterPath]
            .drawPaths,
        state.value!.currentDrawPath!,
      ],
    );

    handleConvertImage(
      characterPath: newCharacterDrawPath.characterPath,
      drawPaths: newCharacterDrawPath.drawPaths,
      idCharacterDrawPath: newCharacterDrawPath.id,
      previousImage: newCharacterDrawPath.image,
    );

    if (state.value!.currentDrawPath != null &&
        state.value!.currentDrawPath!.indexCharacterPath >= 0) {
      state = AsyncData(
        state.value!.copyWith(
          isDrawing: false,
          characterDraw: state.value!.characterDraw.copyWith(
            characterDrawPaths: [
              ...state.value!.characterDraw.characterDrawPaths
                  .take(
                    state.value!.currentDrawPath!.indexCharacterPath,
                  )
                  .toList(),
              newCharacterDrawPath,
              ...state.value!.characterDraw.characterDrawPaths
                  .skip(
                    state.value!.currentDrawPath!.indexCharacterPath + 1,
                  )
                  .toList(),
            ],
          ),
          currentDrawPath: null,
        ),
      );
    }
  }

  void _handleAddNewDrawPathToBackground() {
    final newBackgroundDrawPath =
        state.value!.characterDraw.backgroundDrawPaths.copyWith(
      drawPaths: [
        ...state.value!.characterDraw.backgroundDrawPaths.drawPaths,
        state.value!.currentDrawPath!,
      ],
    );

    handleConvertImage(
      characterPath: Path()..addRect(Rect.largest),
      drawPaths: newBackgroundDrawPath.drawPaths,
      idCharacterDrawPath: "background",
      previousImage: newBackgroundDrawPath.image,
    );

    state = AsyncData(state.value!.copyWith(
      isDrawing: false,
      characterDraw: state.value!.characterDraw.copyWith(
        backgroundDrawPaths: newBackgroundDrawPath,
      ),
      currentDrawPath: null,
    ));
  }

  void _handlePushUndoDrewPathStack(DrawPath drewPath) {
    late stack.Stack<DrawPath> newStack;

    if (state.value!.drewPathStack == null) {
      newStack = stack.Stack<DrawPath>([]);
    } else {
      newStack = state.value!.drewPathStack!.copyWith();
    }

    newStack.push(drewPath);

    state = AsyncData(
      state.value!.copyWith(
        drewPathStack: newStack,
        undidPathStack: null,
      ),
    );
  }
}

@riverpod
Size sizeCanvas(SizeCanvasRef ref) {
  return const Size(540, 260);
}

final modeToolLeftStateProvider =
    StateProvider<ModeToolLeft>((ref) => ModeToolLeft.brush);

final modeToolRightStateProvider =
    StateProvider<ModeToolRight>((ref) => ModeToolRight.move);
