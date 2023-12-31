import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart';
import 'package:master_source_flutter/src/utils/json_converter.dart';

part 'character_draw_background.freezed.dart';
part 'character_draw_background.g.dart';

@freezed
class CharacterDrawBackground with _$CharacterDrawBackground {
  const factory CharacterDrawBackground({
    @ImageJsonConverter() Image? image,
    @Default([]) List<DrawPath> drawPaths,
  }) = _CharacterDrawBackground;

  factory CharacterDrawBackground.fromJson(Map<String, Object?> json) =>
      _$CharacterDrawBackgroundFromJson(json);
}
