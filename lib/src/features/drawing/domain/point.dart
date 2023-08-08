import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/utils/json_converter.dart';

part 'point.freezed.dart';
part 'point.g.dart';

@freezed
class Point with _$Point {
  const factory Point({
    required String command,
    @OffsetJsonConverter() Offset? point,
    @OffsetJsonConverter() Offset? controlPoint1,
    @OffsetJsonConverter() Offset? controlPoint2,
    @RadiusJsonConverter() Radius? radius,
    double? rotation,
    @BoolJsonConverter() bool? largeArc,
    @BoolJsonConverter() bool? clockwise,
    @BoolJsonConverter() bool? close,
  }) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
