import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_source_flutter/src/utils/json_converter.dart';

part 'draw_color.freezed.dart';

@freezed
class DrawColor with _$DrawColor {
  const factory DrawColor({
    required int id,
    @ColorJsonConverter() required Color color,
  }) = _DrawColor;
}
