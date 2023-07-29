import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OffsetJsonConverter extends JsonConverter<Offset, Map<String, dynamic>> {
  const OffsetJsonConverter();

  @override
  Offset fromJson(Map<String, dynamic> json) {
    return Offset(json['x'], json['y']);
  }

  @override
  Map<String, dynamic> toJson(Offset object) {
    return {
      'x': object.dx,
      'y': object.dy,
    };
  }
}

class SizeJsonConverter extends JsonConverter<Size, Map<String, dynamic>> {
  const SizeJsonConverter();

  @override
  Size fromJson(Map<String, dynamic> json) {
    return Size(json['width'], json['height']);
  }

  @override
  Map<String, dynamic> toJson(Size object) {
    return {
      'width': object.width,
      'height': object.height,
    };
  }
}
