import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_source_flutter/src/utils/json_converter.dart';

import 'package:master_source_flutter/src/features/drawing/domain/paintbrush.dart';

part 'draw_path.freezed.dart';
part 'draw_path.g.dart';

@freezed
class DrawPath with _$DrawPath {
  const factory DrawPath({
    required String id,
    @Default([]) @OffsetJsonConverter() List<Offset> points,
    required Paintbrush paintbrush,
    required int indexCharacterPath,
  }) = _DrawPath;

  factory DrawPath.fromJson(Map<String, Object?> json) =>
      _$DrawPathFromJson(json);
}
