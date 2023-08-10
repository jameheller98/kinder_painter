// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DrawColor _$$_DrawColorFromJson(Map<String, dynamic> json) => _$_DrawColor(
      id: json['id'] as int,
      color: const ColorHexJsonConverter().fromJson(json['color'] as String),
    );

Map<String, dynamic> _$$_DrawColorToJson(_$_DrawColor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': const ColorHexJsonConverter().toJson(instance.color),
    };
