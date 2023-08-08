import 'package:flutter/material.dart';
import 'package:master_source_flutter/src/features/drawing/domain/scale_pan.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scale_pan_controller.g.dart';

@riverpod
class ScalePanController extends _$ScalePanController {
  @override
  ScalePan build() {
    return const ScalePan(
      ratioScale: 1,
      tempRatioScale: 1,
      isScalingAndPan: false,
      tempPanDistance: Offset.zero,
      panDistance: Offset.zero,
      focalPoint: Offset.zero,
    );
  }

  void handleScaleAndPanStart(ScaleStartDetails details) {
    state = state.copyWith(
      isScalingAndPan: true,
      focalPoint: details.localFocalPoint,
    );
  }

  void handleScaleAndPanMove(ScaleUpdateDetails details) {
    state = state.copyWith(
      tempRatioScale: state.ratioScale * details.scale,
      tempPanDistance:
          state.panDistance + details.localFocalPoint - state.focalPoint,
    );
  }

  void handleScaleAndPanEnd(ScaleEndDetails details) {
    state = state.copyWith(
      ratioScale: state.tempRatioScale,
      isScalingAndPan: false,
      panDistance: state.tempPanDistance,
    );
  }

  void resetScaleAndPan() {
    state = const ScalePan(
      ratioScale: 1,
      tempRatioScale: 1,
      isScalingAndPan: false,
      tempPanDistance: Offset.zero,
      panDistance: Offset.zero,
      focalPoint: Offset.zero,
    );
  }
}
