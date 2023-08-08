import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_source_flutter/src/features/drawing/domain/character_draw_background.dart';

import 'package:master_source_flutter/src/utils/canvas_utils.dart';

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

class ColorJsonConverter extends JsonConverter<Color, int> {
  const ColorJsonConverter();

  @override
  Color fromJson(int json) {
    return Color(json);
  }

  @override
  int toJson(Color object) {
    return object.value;
  }
}

class Uint8ListJsonConverter extends JsonConverter<Uint8List?, List<int>?> {
  const Uint8ListJsonConverter();

  @override
  Uint8List? fromJson(List<int>? json) {
    if (json == null) {
      return null;
    }

    return Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    if (object == null) {
      return null;
    }

    return object.toList();
  }
}

class RadiusJsonConverter extends JsonConverter<Radius, Map<String, String>> {
  const RadiusJsonConverter();

  @override
  Radius fromJson(Map<String, String> json) {
    if (json['rx'] == null || json['ry'] == null) {
      return Radius.zero;
    }

    return Radius.elliptical(
      double.parse(json['rx']!),
      double.parse(json['ry']!),
    );
  }

  @override
  Map<String, String> toJson(Radius object) {
    return {
      'rx': object.x.toString(),
      'ry': object.y.toString(),
    };
  }
}

class BoolJsonConverter extends JsonConverter<bool, int> {
  const BoolJsonConverter();

  @override
  bool fromJson(int json) {
    return json == 0 ? false : true;
  }

  @override
  int toJson(bool object) {
    return object == true ? 1 : 0;
  }
}

class CharacterBackgroundJsonConverter
    extends JsonConverter<CharacterDrawBackground, Map<String, dynamic>?> {
  const CharacterBackgroundJsonConverter();

  @override
  CharacterDrawBackground fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const CharacterDrawBackground();
    }

    return CharacterDrawBackground(
      drawPaths: json['drawPaths'],
    );
  }

  @override
  Map<String, dynamic> toJson(CharacterDrawBackground object) {
    return {
      'drawPaths': object.drawPaths,
    };
  }
}

class PathJsonConverter extends JsonConverter<Path, String> {
  const PathJsonConverter();

  @override
  Path fromJson(String json) {
    final regexSplitCommand = RegExp(r'(?=[MLHVCSQTAZ])');
    final commands = json.split(regexSplitCommand);
    final points = CanvasUtils.handleParseSvgToPoint(commands);
    final path = Path();
    final mx = Matrix4.identity();

    for (final point in points) {
      switch (point.command) {
        case 'M':
          path.moveTo(
            point.point!.dx,
            point.point!.dy,
          );
          break;
        case 'L':
        case 'H':
        case 'V':
          path.lineTo(
            point.point!.dx,
            point.point!.dy,
          );
          break;
        case 'C':
        case 'S':
          path.cubicTo(
            point.controlPoint1!.dx,
            point.controlPoint1!.dy,
            point.controlPoint2!.dx,
            point.controlPoint2!.dy,
            point.point!.dx,
            point.point!.dy,
          );
          break;
        case 'Q':
        case 'T':
          path.quadraticBezierTo(
            point.controlPoint2!.dx,
            point.controlPoint2!.dy,
            point.point!.dx,
            point.point!.dy,
          );
          break;
        case 'A':
          path.arcToPoint(
            point.point!,
            radius: point.radius!,
            rotation: point.rotation!,
            largeArc: point.largeArc!,
            clockwise: point.clockwise!,
          );
          break;
        case 'Z':
          path.close();
      }
    }

    mx.translate(540 / 2, 260 / 2);
    mx.scale(260 / 375, 260 / 375);
    mx.translate(-540 / 2, -260 / 2);

    return path
        .shift(
          const Offset(540 / 2 - 375 / 2, (260 - 375) / 2),
        )
        .transform(mx.storage);
  }

  @override
  String toJson(Path object) {
    return '';
  }
}
