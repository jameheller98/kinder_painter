// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_draw_background.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterDrawBackground _$$_CharacterDrawBackgroundFromJson(
        Map<String, dynamic> json) =>
    _$_CharacterDrawBackground(
      unit8ListImage: const Uint8ListJsonConverter()
          .fromJson(json['unit8ListImage'] as List<int>?),
      drawPaths: (json['drawPaths'] as List<dynamic>?)
              ?.map((e) => DrawPath.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CharacterDrawBackgroundToJson(
        _$_CharacterDrawBackground instance) =>
    <String, dynamic>{
      'unit8ListImage':
          const Uint8ListJsonConverter().toJson(instance.unit8ListImage),
      'drawPaths': instance.drawPaths,
    };
