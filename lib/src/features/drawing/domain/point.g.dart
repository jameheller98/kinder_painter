// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Point _$$_PointFromJson(Map<String, dynamic> json) => _$_Point(
      command: json['command'] as String,
      point: _$JsonConverterFromJson<Map<String, dynamic>, Offset>(
          json['point'], const OffsetJsonConverter().fromJson),
      controlPoint1: _$JsonConverterFromJson<Map<String, dynamic>, Offset>(
          json['controlPoint1'], const OffsetJsonConverter().fromJson),
      controlPoint2: _$JsonConverterFromJson<Map<String, dynamic>, Offset>(
          json['controlPoint2'], const OffsetJsonConverter().fromJson),
      radius: _$JsonConverterFromJson<Map<String, String>, Radius>(
          json['radius'], const RadiusJsonConverter().fromJson),
      rotation: (json['rotation'] as num?)?.toDouble(),
      largeArc: _$JsonConverterFromJson<int, bool>(
          json['largeArc'], const BoolJsonConverter().fromJson),
      clockwise: _$JsonConverterFromJson<int, bool>(
          json['clockwise'], const BoolJsonConverter().fromJson),
      close: _$JsonConverterFromJson<int, bool>(
          json['close'], const BoolJsonConverter().fromJson),
    );

Map<String, dynamic> _$$_PointToJson(_$_Point instance) => <String, dynamic>{
      'command': instance.command,
      'point': _$JsonConverterToJson<Map<String, dynamic>, Offset>(
          instance.point, const OffsetJsonConverter().toJson),
      'controlPoint1': _$JsonConverterToJson<Map<String, dynamic>, Offset>(
          instance.controlPoint1, const OffsetJsonConverter().toJson),
      'controlPoint2': _$JsonConverterToJson<Map<String, dynamic>, Offset>(
          instance.controlPoint2, const OffsetJsonConverter().toJson),
      'radius': _$JsonConverterToJson<Map<String, String>, Radius>(
          instance.radius, const RadiusJsonConverter().toJson),
      'rotation': instance.rotation,
      'largeArc': _$JsonConverterToJson<int, bool>(
          instance.largeArc, const BoolJsonConverter().toJson),
      'clockwise': _$JsonConverterToJson<int, bool>(
          instance.clockwise, const BoolJsonConverter().toJson),
      'close': _$JsonConverterToJson<int, bool>(
          instance.close, const BoolJsonConverter().toJson),
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
