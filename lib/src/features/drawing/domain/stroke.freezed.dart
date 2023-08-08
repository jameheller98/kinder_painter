// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stroke.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stroke _$StrokeFromJson(Map<String, dynamic> json) {
  return _Stroke.fromJson(json);
}

/// @nodoc
mixin _$Stroke {
  double get widthStroke => throw _privateConstructorUsedError;
  @ColorJsonConverter()
  Color get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrokeCopyWith<Stroke> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrokeCopyWith<$Res> {
  factory $StrokeCopyWith(Stroke value, $Res Function(Stroke) then) =
      _$StrokeCopyWithImpl<$Res, Stroke>;
  @useResult
  $Res call({double widthStroke, @ColorJsonConverter() Color color});
}

/// @nodoc
class _$StrokeCopyWithImpl<$Res, $Val extends Stroke>
    implements $StrokeCopyWith<$Res> {
  _$StrokeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widthStroke = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      widthStroke: null == widthStroke
          ? _value.widthStroke
          : widthStroke // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StrokeCopyWith<$Res> implements $StrokeCopyWith<$Res> {
  factory _$$_StrokeCopyWith(_$_Stroke value, $Res Function(_$_Stroke) then) =
      __$$_StrokeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double widthStroke, @ColorJsonConverter() Color color});
}

/// @nodoc
class __$$_StrokeCopyWithImpl<$Res>
    extends _$StrokeCopyWithImpl<$Res, _$_Stroke>
    implements _$$_StrokeCopyWith<$Res> {
  __$$_StrokeCopyWithImpl(_$_Stroke _value, $Res Function(_$_Stroke) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widthStroke = null,
    Object? color = null,
  }) {
    return _then(_$_Stroke(
      widthStroke: null == widthStroke
          ? _value.widthStroke
          : widthStroke // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stroke implements _Stroke {
  const _$_Stroke(
      {this.widthStroke = 6, @ColorJsonConverter() this.color = Colors.black});

  factory _$_Stroke.fromJson(Map<String, dynamic> json) =>
      _$$_StrokeFromJson(json);

  @override
  @JsonKey()
  final double widthStroke;
  @override
  @JsonKey()
  @ColorJsonConverter()
  final Color color;

  @override
  String toString() {
    return 'Stroke(widthStroke: $widthStroke, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stroke &&
            (identical(other.widthStroke, widthStroke) ||
                other.widthStroke == widthStroke) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, widthStroke, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StrokeCopyWith<_$_Stroke> get copyWith =>
      __$$_StrokeCopyWithImpl<_$_Stroke>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StrokeToJson(
      this,
    );
  }
}

abstract class _Stroke implements Stroke {
  const factory _Stroke(
      {final double widthStroke,
      @ColorJsonConverter() final Color color}) = _$_Stroke;

  factory _Stroke.fromJson(Map<String, dynamic> json) = _$_Stroke.fromJson;

  @override
  double get widthStroke;
  @override
  @ColorJsonConverter()
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$_StrokeCopyWith<_$_Stroke> get copyWith =>
      throw _privateConstructorUsedError;
}
