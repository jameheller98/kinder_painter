// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Material _$$_MaterialFromJson(Map<String, dynamic> json) => _$_Material(
      id: json['id'] as int,
      type: $enumDecode(_$TypeMaterialEnumMap, json['type']),
      colors: (json['colors'] as List<dynamic>?)
              ?.map((e) => DrawColor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      patterns: (json['patterns'] as List<dynamic>?)
              ?.map((e) => DrawPattern.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stickers: (json['stickers'] as List<dynamic>?)
              ?.map((e) => DrawSticker.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MaterialToJson(_$_Material instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TypeMaterialEnumMap[instance.type]!,
      'colors': instance.colors,
      'patterns': instance.patterns,
      'stickers': instance.stickers,
    };

const _$TypeMaterialEnumMap = {
  TypeMaterial.color: 'color',
  TypeMaterial.pattern: 'pattern',
  TypeMaterial.sticker: 'sticker',
};
