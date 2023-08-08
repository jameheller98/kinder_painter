import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/utils/json_converter.dart';

part 'stroke.freezed.dart';
part 'stroke.g.dart';

@freezed
class Stroke with _$Stroke {
  const factory Stroke({
    @Default(6) double widthStroke,
    @Default(Colors.black) @ColorJsonConverter() Color color,
  }) = _Stroke;

  factory Stroke.fromJson(Map<String, Object?> json) => _$StrokeFromJson(json);
}
