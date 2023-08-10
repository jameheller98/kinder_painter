import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/stroke.dart';
import 'package:master_source_flutter/src/utils/json_converter.dart';

part 'paintbrush.freezed.dart';
part 'paintbrush.g.dart';

enum TypePaintbrush {
  crayon,
  pencil,
  paintBrush,
  waterPen,
  waterPaint,
  eraser,
}

@freezed
class Paintbrush with _$Paintbrush {
  const factory Paintbrush({
    Stroke? stroke,
    @ColorJsonConverter() Color? fill,
    int? idImagePattern,
    @Default(TypePaintbrush.crayon) TypePaintbrush type,
    @Default(BlendMode.srcOver) BlendMode blendMode,
  }) = _Paintbrush;

  factory Paintbrush.fromJson(Map<String, Object?> json) =>
      _$PaintbrushFromJson(json);
}
