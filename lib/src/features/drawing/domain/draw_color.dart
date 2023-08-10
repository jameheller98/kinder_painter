import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_source_flutter/src/utils/json_converter.dart';

part 'draw_color.freezed.dart';
part 'draw_color.g.dart';

@freezed
class DrawColor with _$DrawColor {
  const factory DrawColor({
    required int id,
    @ColorHexJsonConverter() required Color color,
  }) = _DrawColor;

  factory DrawColor.fromJson(Map<String, Object?> json) =>
      _$DrawColorFromJson(json);
}
