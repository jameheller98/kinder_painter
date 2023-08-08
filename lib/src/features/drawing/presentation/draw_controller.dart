import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:master_source_flutter/src/constants/stack.dart' as stack;
import 'package:master_source_flutter/src/features/drawing/application/drawing_service.dart';
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
    final characterDraw =
        await ref.read(drawingServiceProvider.notifier).fetchDrawingCharacter();

    return Draw(characterDraw: characterDraw);
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

    if (paintbrush.type == TypePaintbrush.waterPaint &&
        state.value!.characterDraw
                .lastDrawPathOfCharacter(lastIndexDrawPaths)
                ?.paintbrush
                .fill ==
            paintbrush.fill) {
      return;
    }

    final currentDrawPath = DrawPath(
      id: uuid.v4(),
      indexCharacterPath: lastIndexDrawPaths,
      paintbrush: paintbrush,
      points: [details.localPosition],
    );

    state = AsyncData(state.value!.copyWith(
      isDrawing: true,
      currentDrawPath: currentDrawPath,
    ));
  }

  void handleTouchMove(DragUpdateDetails details) {
    final paintbrush = ref.read(paintbrushControllerProvider);

    if (!state.value!.isDrawing ||
        state.value!.currentDrawPath == null ||
        paintbrush.type == TypePaintbrush.waterPaint) {
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

  void handleUndoPath() async {
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

    final pngImageDrawPathBytes = await handleConvertImage(
      characterPath: indexDrewPathCurrent >= 0
          ? characterDrawPath!.characterPath
          : rectPath,
      drawPaths: newDrawPath,
      idCharacterDrawPath:
          indexDrewPathCurrent >= 0 ? characterDrawPath!.id : "background",
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
                            unit8ListImage:
                                pngImageDrawPathBytes?.buffer.asUint8List() ??
                                    [] as Uint8List,
                            drawPaths: newDrawPath,
                          )
                        : characterDrawPath,
                  )
                  .toList()
              : state.value!.characterDraw.characterDrawPaths,
          backgroundDrawPaths: indexDrewPathCurrent < 0
              ? state.value!.characterDraw.backgroundDrawPaths.copyWith(
                  unit8ListImage: pngImageDrawPathBytes?.buffer.asUint8List() ??
                      [] as Uint8List,
                  drawPaths: newDrawPath,
                )
              : state.value!.characterDraw.backgroundDrawPaths,
        ),
      ),
    );
  }

  void handleRedoPath() async {
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
    final pngImageDrawPathBytes = await handleConvertImage(
      characterPath: indexUndidPathCurrent >= 0
          ? characterDrawPath!.characterPath
          : rectPath,
      drawPaths: newDrawPath,
      idCharacterDrawPath:
          indexUndidPathCurrent >= 0 ? characterDrawPath!.id : "background",
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
                            unit8ListImage:
                                pngImageDrawPathBytes?.buffer.asUint8List() ??
                                    [] as Uint8List,
                            drawPaths: newDrawPath,
                          )
                        : characterDrawPath,
                  )
                  .toList()
              : state.value!.characterDraw.characterDrawPaths,
          backgroundDrawPaths: indexUndidPathCurrent < 0
              ? state.value!.characterDraw.backgroundDrawPaths.copyWith(
                  unit8ListImage: pngImageDrawPathBytes?.buffer.asUint8List() ??
                      [] as Uint8List,
                  drawPaths: newDrawPath,
                )
              : state.value!.characterDraw.backgroundDrawPaths,
        ),
      ),
    );
  }

  ui.Picture canvasToPicture(
      {required Path characterPath, required List<DrawPath> drawPaths}) {
    final Size sizeCanvas = ref.read(sizeCanvasProvider);
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    DrawImageToSave drawPainter = DrawImageToSave(
      characterPath: characterPath,
      drawPaths: drawPaths,
    );
    drawPainter.paint(canvas, sizeCanvas);
    return recorder.endRecording();
  }

  Future<ui.Image>? bytesToImage(Uint8List imgBytes) async {
    ui.Codec codec = await ui.instantiateImageCodec(imgBytes);
    ui.FrameInfo frame;
    try {
      frame = await codec.getNextFrame();
    } finally {
      codec.dispose();
    }
    return frame.image;
  }

  Future<ByteData?> handleConvertImage({
    required Path characterPath,
    required List<DrawPath> drawPaths,
    required String idCharacterDrawPath,
  }) async {
    final Size sizeCanvas = ref.read(sizeCanvasProvider);
    final ui.Picture pictureDrawPath = canvasToPicture(
      characterPath: characterPath,
      drawPaths: drawPaths,
    );

    listPictureCharacterDrawPath.addEntries(
      {
        idCharacterDrawPath: CharacterDrawPicture(
          picture: pictureDrawPath,
          idCharacterDrawPath: idCharacterDrawPath,
        ),
      }.entries,
    );

    return pictureDrawPath
        .toImageSync(
          (sizeCanvas.width * 2).floor(),
          (sizeCanvas.height * 2).floor(),
        )
        .toByteData(format: ui.ImageByteFormat.png);
  }

  void _handleAddNewDrawPathToCharacterPath() async {
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

    final pngImageDrawPathBytes = await handleConvertImage(
      characterPath: newCharacterDrawPath.characterPath,
      drawPaths: newCharacterDrawPath.drawPaths,
      idCharacterDrawPath: newCharacterDrawPath.id,
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
              newCharacterDrawPath.copyWith(
                unit8ListImage: pngImageDrawPathBytes?.buffer.asUint8List() ??
                    [] as Uint8List,
              ),
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

  void _handleAddNewDrawPathToBackground() async {
    final newBackgroundDrawPath =
        state.value!.characterDraw.backgroundDrawPaths.copyWith(
      drawPaths: [
        ...state.value!.characterDraw.backgroundDrawPaths.drawPaths,
        state.value!.currentDrawPath!,
      ],
    );

    final pngImageDrawPathBytes = await handleConvertImage(
      characterPath: Path()..addRect(Rect.largest),
      drawPaths: newBackgroundDrawPath.drawPaths,
      idCharacterDrawPath: "background",
    );

    state = AsyncData(state.value!.copyWith(
      isDrawing: false,
      characterDraw: state.value!.characterDraw.copyWith(
        backgroundDrawPaths: newBackgroundDrawPath.copyWith(
          unit8ListImage:
              pngImageDrawPathBytes?.buffer.asUint8List() ?? [] as Uint8List,
        ),
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
