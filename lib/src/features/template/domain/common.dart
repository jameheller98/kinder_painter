import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'common.freezed.dart';
part 'common.g.dart';

@freezed
class Common with _$Common {
  factory Common({required String id}) = _Common;

  factory Common.fromJson(Map<String, Object?> json) => _$CommonFromJson(json);
}
