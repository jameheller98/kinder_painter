import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/material.dart';

part 'draw_material.freezed.dart';

@freezed
class DrawMaterial with _$DrawMaterial {
  const factory DrawMaterial({
    required Material currentMaterial,
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<Map<String, dynamic>>? listImagePattern,
    required List<Material> materials,
  }) = _DrawMaterial;
}
