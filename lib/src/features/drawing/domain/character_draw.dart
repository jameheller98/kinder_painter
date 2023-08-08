import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:master_source_flutter/src/features/drawing/domain/character_draw_background.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw_path.dart';
import 'package:master_source_flutter/src/features/drawing/domain/draw_path.dart';
import 'package:master_source_flutter/src/utils/json_converter.dart';

part 'character_draw.freezed.dart';
part 'character_draw.g.dart';

@freezed
class CharacterDraw with _$CharacterDraw {
  const CharacterDraw._();

  const factory CharacterDraw({
    required String id,
    @Default([]) List<CharacterDrawPath> characterDrawPaths,
    @CharacterBackgroundJsonConverter()
    required CharacterDrawBackground backgroundDrawPaths,
  }) = _CharacterDraw;

  factory CharacterDraw.fromJson(Map<String, Object?> json) =>
      _$CharacterDrawFromJson(json);

  DrawPath? lastDrawPathOfCharacter(int indexCharacterDrawPath) {
    if (indexCharacterDrawPath >= 0 &&
        characterDrawPaths[indexCharacterDrawPath].drawPaths.isNotEmpty) {
      return characterDrawPaths[indexCharacterDrawPath].drawPaths.last;
    }

    if (indexCharacterDrawPath == -1 &&
        backgroundDrawPaths.drawPaths.isNotEmpty) {
      return backgroundDrawPaths.drawPaths.last;
    }

    return null;
  }
}
