// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stroke _$$_StrokeFromJson(Map<String, dynamic> json) => _$_Stroke(
      widthStroke: (json['widthStroke'] as num?)?.toDouble() ?? 6,
      color: json['color'] == null
          ? Colors.black
          : const ColorJsonConverter().fromJson(json['color'] as int),
    );

Map<String, dynamic> _$$_StrokeToJson(_$_Stroke instance) => <String, dynamic>{
      'widthStroke': instance.widthStroke,
      'color': const ColorJsonConverter().toJson(instance.color),
    };
