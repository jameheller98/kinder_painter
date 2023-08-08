// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw_path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DrawPath _$$_DrawPathFromJson(Map<String, dynamic> json) => _$_DrawPath(
      id: json['id'] as String,
      points: (json['points'] as List<dynamic>?)
              ?.map((e) => const OffsetJsonConverter()
                  .fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      paintbrush:
          Paintbrush.fromJson(json['paintbrush'] as Map<String, dynamic>),
      indexCharacterPath: json['indexCharacterPath'] as int,
    );

Map<String, dynamic> _$$_DrawPathToJson(_$_DrawPath instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points':
          instance.points.map(const OffsetJsonConverter().toJson).toList(),
      'paintbrush': instance.paintbrush,
      'indexCharacterPath': instance.indexCharacterPath,
    };
