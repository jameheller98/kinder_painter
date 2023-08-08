// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paintbrush.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Paintbrush _$$_PaintbrushFromJson(Map<String, dynamic> json) =>
    _$_Paintbrush(
      stroke: json['stroke'] == null
          ? null
          : Stroke.fromJson(json['stroke'] as Map<String, dynamic>),
      fill: _$JsonConverterFromJson<int, Color>(
          json['fill'], const ColorJsonConverter().fromJson),
      type: $enumDecodeNullable(_$TypePaintbrushEnumMap, json['type']) ??
          TypePaintbrush.crayon,
      blendMode: $enumDecodeNullable(_$BlendModeEnumMap, json['blendMode']) ??
          BlendMode.srcOver,
    );

Map<String, dynamic> _$$_PaintbrushToJson(_$_Paintbrush instance) =>
    <String, dynamic>{
      'stroke': instance.stroke,
      'fill': _$JsonConverterToJson<int, Color>(
          instance.fill, const ColorJsonConverter().toJson),
      'type': _$TypePaintbrushEnumMap[instance.type]!,
      'blendMode': _$BlendModeEnumMap[instance.blendMode]!,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$TypePaintbrushEnumMap = {
  TypePaintbrush.crayon: 'crayon',
  TypePaintbrush.pencil: 'pencil',
  TypePaintbrush.paintBrush: 'paintBrush',
  TypePaintbrush.waterPen: 'waterPen',
  TypePaintbrush.waterPaint: 'waterPaint',
  TypePaintbrush.eraser: 'eraser',
};

const _$BlendModeEnumMap = {
  BlendMode.clear: 'clear',
  BlendMode.src: 'src',
  BlendMode.dst: 'dst',
  BlendMode.srcOver: 'srcOver',
  BlendMode.dstOver: 'dstOver',
  BlendMode.srcIn: 'srcIn',
  BlendMode.dstIn: 'dstIn',
  BlendMode.srcOut: 'srcOut',
  BlendMode.dstOut: 'dstOut',
  BlendMode.srcATop: 'srcATop',
  BlendMode.dstATop: 'dstATop',
  BlendMode.xor: 'xor',
  BlendMode.plus: 'plus',
  BlendMode.modulate: 'modulate',
  BlendMode.screen: 'screen',
  BlendMode.overlay: 'overlay',
  BlendMode.darken: 'darken',
  BlendMode.lighten: 'lighten',
  BlendMode.colorDodge: 'colorDodge',
  BlendMode.colorBurn: 'colorBurn',
  BlendMode.hardLight: 'hardLight',
  BlendMode.softLight: 'softLight',
  BlendMode.difference: 'difference',
  BlendMode.exclusion: 'exclusion',
  BlendMode.multiply: 'multiply',
  BlendMode.hue: 'hue',
  BlendMode.saturation: 'saturation',
  BlendMode.color: 'color',
  BlendMode.luminosity: 'luminosity',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
