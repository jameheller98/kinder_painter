// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draw_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DrawColor _$DrawColorFromJson(Map<String, dynamic> json) {
  return _DrawColor.fromJson(json);
}

/// @nodoc
mixin _$DrawColor {
  int get id => throw _privateConstructorUsedError;
  @ColorHexJsonConverter()
  Color get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrawColorCopyWith<DrawColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawColorCopyWith<$Res> {
  factory $DrawColorCopyWith(DrawColor value, $Res Function(DrawColor) then) =
      _$DrawColorCopyWithImpl<$Res, DrawColor>;
  @useResult
  $Res call({int id, @ColorHexJsonConverter() Color color});
}

/// @nodoc
class _$DrawColorCopyWithImpl<$Res, $Val extends DrawColor>
    implements $DrawColorCopyWith<$Res> {
  _$DrawColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DrawColorCopyWith<$Res> implements $DrawColorCopyWith<$Res> {
  factory _$$_DrawColorCopyWith(
          _$_DrawColor value, $Res Function(_$_DrawColor) then) =
      __$$_DrawColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, @ColorHexJsonConverter() Color color});
}

/// @nodoc
class __$$_DrawColorCopyWithImpl<$Res>
    extends _$DrawColorCopyWithImpl<$Res, _$_DrawColor>
    implements _$$_DrawColorCopyWith<$Res> {
  __$$_DrawColorCopyWithImpl(
      _$_DrawColor _value, $Res Function(_$_DrawColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
  }) {
    return _then(_$_DrawColor(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DrawColor implements _DrawColor {
  const _$_DrawColor(
      {required this.id, @ColorHexJsonConverter() required this.color});

  factory _$_DrawColor.fromJson(Map<String, dynamic> json) =>
      _$$_DrawColorFromJson(json);

  @override
  final int id;
  @override
  @ColorHexJsonConverter()
  final Color color;

  @override
  String toString() {
    return 'DrawColor(id: $id, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrawColor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DrawColorCopyWith<_$_DrawColor> get copyWith =>
      __$$_DrawColorCopyWithImpl<_$_DrawColor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrawColorToJson(
      this,
    );
  }
}

abstract class _DrawColor implements DrawColor {
  const factory _DrawColor(
      {required final int id,
      @ColorHexJsonConverter() required final Color color}) = _$_DrawColor;

  factory _DrawColor.fromJson(Map<String, dynamic> json) =
      _$_DrawColor.fromJson;

  @override
  int get id;
  @override
  @ColorHexJsonConverter()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$_DrawColorCopyWith<_$_DrawColor> get copyWith =>
      throw _privateConstructorUsedError;
}
