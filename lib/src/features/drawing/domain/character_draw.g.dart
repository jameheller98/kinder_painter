// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_draw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterDraw _$$_CharacterDrawFromJson(Map<String, dynamic> json) =>
    _$_CharacterDraw(
      id: json['id'] as String,
      characterDrawPaths: (json['characterDrawPaths'] as List<dynamic>?)
              ?.map(
                  (e) => CharacterDrawPath.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      backgroundDrawPaths: const CharacterBackgroundJsonConverter()
          .fromJson(json['backgroundDrawPaths'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_CharacterDrawToJson(_$_CharacterDraw instance) =>
    <String, dynamic>{
      'id': instance.id,
      'characterDrawPaths': instance.characterDrawPaths,
      'backgroundDrawPaths': const CharacterBackgroundJsonConverter()
          .toJson(instance.backgroundDrawPaths),
    };
