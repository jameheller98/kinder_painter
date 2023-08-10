import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_pattern.freezed.dart';
part 'draw_pattern.g.dart';

@freezed
class DrawPattern with _$DrawPattern {
  const factory DrawPattern({
    required int id,
    required String pattern,
  }) = _DrawPattern;

  factory DrawPattern.fromJson(Map<String, Object?> json) =>
      _$DrawPatternFromJson(json);
}
