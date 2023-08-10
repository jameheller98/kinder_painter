// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_draw_path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterDrawPath _$$_CharacterDrawPathFromJson(Map<String, dynamic> json) =>
    _$_CharacterDrawPath(
      id: json['id'] as String,
      characterPath:
          const PathJsonConverter().fromJson(json['characterPath'] as String),
      drawPaths: (json['drawPaths'] as List<dynamic>?)
              ?.map((e) => DrawPath.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fill: _$JsonConverterFromJson<int, Color>(
          json['fill'], const ColorJsonConverter().fromJson),
      stroke: json['stroke'] == null
          ? null
          : Stroke.fromJson(json['stroke'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CharacterDrawPathToJson(
        _$_CharacterDrawPath instance) =>
    <String, dynamic>{
      'id': instance.id,
      'characterPath': const PathJsonConverter().toJson(instance.characterPath),
      'image': const ImageJsonConverter().toJson(instance.image),
      'drawPaths': instance.drawPaths,
      'fill': _$JsonConverterToJson<int, Color>(
          instance.fill, const ColorJsonConverter().toJson),
      'stroke': instance.stroke,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
