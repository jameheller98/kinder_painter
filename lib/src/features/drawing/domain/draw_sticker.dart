import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_sticker.freezed.dart';

@freezed
class DrawSticker with _$DrawSticker {
  const factory DrawSticker({
    required int id,
  }) = _DrawSticker;
}
