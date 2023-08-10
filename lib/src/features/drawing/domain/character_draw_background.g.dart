// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_draw_background.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterDrawBackground _$$_CharacterDrawBackgroundFromJson(
        Map<String, dynamic> json) =>
    _$_CharacterDrawBackground(
      image: _$JsonConverterFromJson<Future<String?>, Image?>(
          json['image'], const ImageJsonConverter().fromJson),
      drawPaths: (json['drawPaths'] as List<dynamic>?)
              ?.map((e) => DrawPath.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CharacterDrawBackgroundToJson(
        _$_CharacterDrawBackground instance) =>
    <String, dynamic>{
      'image': const ImageJsonConverter().toJson(instance.image),
      'drawPaths': instance.drawPaths,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
