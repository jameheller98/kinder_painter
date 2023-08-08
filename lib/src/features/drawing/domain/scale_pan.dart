import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scale_pan.freezed.dart';

@freezed
class ScalePan with _$ScalePan {
  const factory ScalePan({
    required double ratioScale,
    required double tempRatioScale,
    required bool isScalingAndPan,
    required Offset focalPoint,
    required Offset tempPanDistance,
    required Offset panDistance,
  }) = _ScalePan;
}
