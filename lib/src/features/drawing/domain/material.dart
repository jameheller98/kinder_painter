import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/draw_color.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw_pattern.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw_sticker.dart';

part 'material.freezed.dart';
part 'material.g.dart';

enum TypeMaterial { color, pattern, sticker }

@freezed
class Material with _$Material {
  const Material._();

  const factory Material({
    required int id,
    required TypeMaterial type,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool isActive,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(0)
    int indexDrawMaterialActive,
    @Default([]) List<DrawColor> colors,
    @Default([]) List<DrawPattern> patterns,
    @Default([]) List<DrawSticker> stickers,
  }) = _Material;

  Color get getColor {
    if (colors.isNotEmpty) {
      return colors[indexDrawMaterialActive].color;
    } else {
      return Colors.black;
    }
  }

  factory Material.fromJson(Map<String, Object?> json) =>
      _$MaterialFromJson(json);
}
