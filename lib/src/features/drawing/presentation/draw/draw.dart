import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_background.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_painter.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_painter_current.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw/draw_size.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/draw_controller.dart';
import 'package:master_source_flutter/src/features/drawing/presentation/scale_pan_controller.dart';

class Draw extends ConsumerWidget {
  const Draw({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawDataAsync = ref.watch(drawControllerProvider);
    final scaleAndPan = ref.watch(
      scalePanControllerProvider,
    );

    return drawDataAsync.when(
      data: (dataDraw) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Transform.translate(
              offset: scaleAndPan.isScalingAndPan
                  ? scaleAndPan.tempPanDistance
                  : scaleAndPan.panDistance,
              child: Transform.scale(
                scale: scaleAndPan.isScalingAndPan
                    ? scaleAndPan.tempRatioScale
                    : scaleAndPan.ratioScale,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (dataDraw.currentDrawPath == null ||
                        dataDraw.currentDrawPath?.paintbrush.type ==
                            TypePaintbrush.waterPaint)
                      RepaintBoundary(
                        child: CustomPaint(
                          isComplex: true,
                          willChange: true,
                          foregroundPainter: DrawPainter(
                            characterDraw: dataDraw.characterDraw,
                            listPictureCharacterDrawPath:
                                DrawController.listPictureCharacterDrawPath,
                          ),
                          child: const DrawSize(),
                        ),
                      ),
                    if (dataDraw.currentDrawPath != null &&
                        dataDraw.currentDrawPath?.paintbrush.type !=
                            TypePaintbrush.waterPaint)
                      RepaintBoundary(
                        child: CustomPaint(
                          isComplex: true,
                          willChange: true,
                          painter: DrawPainterCurrent(
                            listPictureCharacterDrawPath:
                                DrawController.listPictureCharacterDrawPath,
                            characterDraw: dataDraw.characterDraw,
                            currentDrawPath: dataDraw.currentDrawPath!,
                          ),
                          child: const DrawSize(),
                        ),
                      ),
                    const DrawBackground(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
