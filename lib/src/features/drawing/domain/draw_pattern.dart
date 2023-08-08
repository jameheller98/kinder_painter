import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_pattern.freezed.dart';

@freezed
class DrawPattern with _$DrawPattern {
  const factory DrawPattern({
    required int id,
  }) = _DrawPattern;
}
