// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_draw_background.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterDrawBackground _$CharacterDrawBackgroundFromJson(
    Map<String, dynamic> json) {
  return _CharacterDrawBackground.fromJson(json);
}

/// @nodoc
mixin _$CharacterDrawBackground {
  @ImageJsonConverter()
  Image? get image => throw _privateConstructorUsedError;
  List<DrawPath> get drawPaths => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterDrawBackgroundCopyWith<CharacterDrawBackground> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDrawBackgroundCopyWith<$Res> {
  factory $CharacterDrawBackgroundCopyWith(CharacterDrawBackground value,
          $Res Function(CharacterDrawBackground) then) =
      _$CharacterDrawBackgroundCopyWithImpl<$Res, CharacterDrawBackground>;
  @useResult
  $Res call({@ImageJsonConverter() Image? image, List<DrawPath> drawPaths});
}

/// @nodoc
class _$CharacterDrawBackgroundCopyWithImpl<$Res,
        $Val extends CharacterDrawBackground>
    implements $CharacterDrawBackgroundCopyWith<$Res> {
  _$CharacterDrawBackgroundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? drawPaths = null,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
      drawPaths: null == drawPaths
          ? _value.drawPaths
          : drawPaths // ignore: cast_nullable_to_non_nullable
              as List<DrawPath>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterDrawBackgroundCopyWith<$Res>
    implements $CharacterDrawBackgroundCopyWith<$Res> {
  factory _$$_CharacterDrawBackgroundCopyWith(_$_CharacterDrawBackground value,
          $Res Function(_$_CharacterDrawBackground) then) =
      __$$_CharacterDrawBackgroundCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ImageJsonConverter() Image? image, List<DrawPath> drawPaths});
}

/// @nodoc
class __$$_CharacterDrawBackgroundCopyWithImpl<$Res>
    extends _$CharacterDrawBackgroundCopyWithImpl<$Res,
        _$_CharacterDrawBackground>
    implements _$$_CharacterDrawBackgroundCopyWith<$Res> {
  __$$_CharacterDrawBackgroundCopyWithImpl(_$_CharacterDrawBackground _value,
      $Res Function(_$_CharacterDrawBackground) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? drawPaths = null,
  }) {
    return _then(_$_CharacterDrawBackground(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
      drawPaths: null == drawPaths
          ? _value._drawPaths
          : drawPaths // ignore: cast_nullable_to_non_nullable
              as List<DrawPath>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterDrawBackground implements _CharacterDrawBackground {
  const _$_CharacterDrawBackground(
      {@ImageJsonConverter() this.image,
      final List<DrawPath> drawPaths = const []})
      : _drawPaths = drawPaths;

  factory _$_CharacterDrawBackground.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterDrawBackgroundFromJson(json);

  @override
  @ImageJsonConverter()
  final Image? image;
  final List<DrawPath> _drawPaths;
  @override
  @JsonKey()
  List<DrawPath> get drawPaths {
    if (_drawPaths is EqualUnmodifiableListView) return _drawPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drawPaths);
  }

  @override
  String toString() {
    return 'CharacterDrawBackground(image: $image, drawPaths: $drawPaths)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterDrawBackground &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._drawPaths, _drawPaths));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, image, const DeepCollectionEquality().hash(_drawPaths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterDrawBackgroundCopyWith<_$_CharacterDrawBackground>
      get copyWith =>
          __$$_CharacterDrawBackgroundCopyWithImpl<_$_CharacterDrawBackground>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterDrawBackgroundToJson(
      this,
    );
  }
}

abstract class _CharacterDrawBackground implements CharacterDrawBackground {
  const factory _CharacterDrawBackground(
      {@ImageJsonConverter() final Image? image,
      final List<DrawPath> drawPaths}) = _$_CharacterDrawBackground;

  factory _CharacterDrawBackground.fromJson(Map<String, dynamic> json) =
      _$_CharacterDrawBackground.fromJson;

  @override
  @ImageJsonConverter()
  Image? get image;
  @override
  List<DrawPath> get drawPaths;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterDrawBackgroundCopyWith<_$_CharacterDrawBackground>
      get copyWith => throw _privateConstructorUsedError;
}
