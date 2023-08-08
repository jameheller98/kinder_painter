import 'dart:ui' as ui;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_draw_picture.freezed.dart';

@freezed
class CharacterDrawPicture with _$CharacterDrawPicture {
  const factory CharacterDrawPicture({
    required ui.Picture picture,
    required String idCharacterDrawPath,
  }) = _CharacterDrawPicture;
}
