import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_sticker.freezed.dart';
part 'draw_sticker.g.dart';

@freezed
class DrawSticker with _$DrawSticker {
  const factory DrawSticker({
    required int id,
  }) = _DrawSticker;

  factory DrawSticker.fromJson(Map<String, Object?> json) =>
      _$DrawStickerFromJson(json);
}
