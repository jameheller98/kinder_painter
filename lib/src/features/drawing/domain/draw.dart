import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/constants/stack.dart' as stack;
import 'package:master_source_flutter/src/features/drawing/domain/character_draw.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart';

part 'draw.freezed.dart';
part 'draw.g.dart';

@freezed
class Draw with _$Draw {
  const factory Draw({
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool isDrawing,
    @JsonKey(includeFromJson: false, includeToJson: false)
    stack.Stack<DrawPath>? drewPathStack,
    @JsonKey(includeFromJson: false, includeToJson: false)
    stack.Stack<DrawPath>? undidPathStack,
    @JsonKey(includeFromJson: false, includeToJson: false)
    DrawPath? currentDrawPath,
    required CharacterDraw characterDraw,
  }) = _Draw;

  factory Draw.fromJson(Map<String, Object?> json) => _$DrawFromJson(json);
}
