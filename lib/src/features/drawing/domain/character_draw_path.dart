import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart';
import 'package:master_source_flutter/src/features/drawing/domain/stroke.dart';
import 'package:master_source_flutter/src/utils/json_converter.dart';

part 'character_draw_path.freezed.dart';
part 'character_draw_path.g.dart';

@freezed
class CharacterDrawPath with _$CharacterDrawPath {
  const factory CharacterDrawPath({
    required String id,
    @PathJsonConverter() required Path characterPath,
    @JsonKey(includeFromJson: false, includeToJson: true)
    @ImageJsonConverter()
    ui.Image? image,
    @Default([]) List<DrawPath> drawPaths,
    @ColorJsonConverter() Color? fill,
    Stroke? stroke,
  }) = _CharacterDrawPath;

  factory CharacterDrawPath.fromJson(Map<String, Object?> json) =>
      _$CharacterDrawPathFromJson(json);
}
