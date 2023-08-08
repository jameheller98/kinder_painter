// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paintbrush.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Paintbrush _$PaintbrushFromJson(Map<String, dynamic> json) {
  return _Paintbrush.fromJson(json);
}

/// @nodoc
mixin _$Paintbrush {
  Stroke? get stroke => throw _privateConstructorUsedError;
  @ColorJsonConverter()
  Color? get fill => throw _privateConstructorUsedError;
  TypePaintbrush get type => throw _privateConstructorUsedError;
  BlendMode get blendMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaintbrushCopyWith<Paintbrush> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaintbrushCopyWith<$Res> {
  factory $PaintbrushCopyWith(
          Paintbrush value, $Res Function(Paintbrush) then) =
      _$PaintbrushCopyWithImpl<$Res, Paintbrush>;
  @useResult
  $Res call(
      {Stroke? stroke,
      @ColorJsonConverter() Color? fill,
      TypePaintbrush type,
      BlendMode blendMode});

  $StrokeCopyWith<$Res>? get stroke;
}

/// @nodoc
class _$PaintbrushCopyWithImpl<$Res, $Val extends Paintbrush>
    implements $PaintbrushCopyWith<$Res> {
  _$PaintbrushCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stroke = freezed,
    Object? fill = freezed,
    Object? type = null,
    Object? blendMode = null,
  }) {
    return _then(_value.copyWith(
      stroke: freezed == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as Stroke?,
      fill: freezed == fill
          ? _value.fill
          : fill // ignore: cast_nullable_to_non_nullable
              as Color?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypePaintbrush,
      blendMode: null == blendMode
          ? _value.blendMode
          : blendMode // ignore: cast_nullable_to_non_nullable
              as BlendMode,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StrokeCopyWith<$Res>? get stroke {
    if (_value.stroke == null) {
      return null;
    }

    return $StrokeCopyWith<$Res>(_value.stroke!, (value) {
      return _then(_value.copyWith(stroke: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaintbrushCopyWith<$Res>
    implements $PaintbrushCopyWith<$Res> {
  factory _$$_PaintbrushCopyWith(
          _$_Paintbrush value, $Res Function(_$_Paintbrush) then) =
      __$$_PaintbrushCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Stroke? stroke,
      @ColorJsonConverter() Color? fill,
      TypePaintbrush type,
      BlendMode blendMode});

  @override
  $StrokeCopyWith<$Res>? get stroke;
}

/// @nodoc
class __$$_PaintbrushCopyWithImpl<$Res>
    extends _$PaintbrushCopyWithImpl<$Res, _$_Paintbrush>
    implements _$$_PaintbrushCopyWith<$Res> {
  __$$_PaintbrushCopyWithImpl(
      _$_Paintbrush _value, $Res Function(_$_Paintbrush) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stroke = freezed,
    Object? fill = freezed,
    Object? type = null,
    Object? blendMode = null,
  }) {
    return _then(_$_Paintbrush(
      stroke: freezed == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as Stroke?,
      fill: freezed == fill
          ? _value.fill
          : fill // ignore: cast_nullable_to_non_nullable
              as Color?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypePaintbrush,
      blendMode: null == blendMode
          ? _value.blendMode
          : blendMode // ignore: cast_nullable_to_non_nullable
              as BlendMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Paintbrush implements _Paintbrush {
  const _$_Paintbrush(
      {this.stroke,
      @ColorJsonConverter() this.fill,
      this.type = TypePaintbrush.crayon,
      this.blendMode = BlendMode.srcOver});

  factory _$_Paintbrush.fromJson(Map<String, dynamic> json) =>
      _$$_PaintbrushFromJson(json);

  @override
  final Stroke? stroke;
  @override
  @ColorJsonConverter()
  final Color? fill;
  @override
  @JsonKey()
  final TypePaintbrush type;
  @override
  @JsonKey()
  final BlendMode blendMode;

  @override
  String toString() {
    return 'Paintbrush(stroke: $stroke, fill: $fill, type: $type, blendMode: $blendMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Paintbrush &&
            (identical(other.stroke, stroke) || other.stroke == stroke) &&
            (identical(other.fill, fill) || other.fill == fill) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.blendMode, blendMode) ||
                other.blendMode == blendMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stroke, fill, type, blendMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaintbrushCopyWith<_$_Paintbrush> get copyWith =>
      __$$_PaintbrushCopyWithImpl<_$_Paintbrush>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaintbrushToJson(
      this,
    );
  }
}

abstract class _Paintbrush implements Paintbrush {
  const factory _Paintbrush(
      {final Stroke? stroke,
      @ColorJsonConverter() final Color? fill,
      final TypePaintbrush type,
      final BlendMode blendMode}) = _$_Paintbrush;

  factory _Paintbrush.fromJson(Map<String, dynamic> json) =
      _$_Paintbrush.fromJson;

  @override
  Stroke? get stroke;
  @override
  @ColorJsonConverter()
  Color? get fill;
  @override
  TypePaintbrush get type;
  @override
  BlendMode get blendMode;
  @override
  @JsonKey(ignore: true)
  _$$_PaintbrushCopyWith<_$_Paintbrush> get copyWith =>
      throw _privateConstructorUsedError;
}
