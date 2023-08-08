// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_draw_picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterDrawPicture {
  ui.Picture get picture => throw _privateConstructorUsedError;
  String get idCharacterDrawPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterDrawPictureCopyWith<CharacterDrawPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDrawPictureCopyWith<$Res> {
  factory $CharacterDrawPictureCopyWith(CharacterDrawPicture value,
          $Res Function(CharacterDrawPicture) then) =
      _$CharacterDrawPictureCopyWithImpl<$Res, CharacterDrawPicture>;
  @useResult
  $Res call({ui.Picture picture, String idCharacterDrawPath});
}

/// @nodoc
class _$CharacterDrawPictureCopyWithImpl<$Res,
        $Val extends CharacterDrawPicture>
    implements $CharacterDrawPictureCopyWith<$Res> {
  _$CharacterDrawPictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = null,
    Object? idCharacterDrawPath = null,
  }) {
    return _then(_value.copyWith(
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as ui.Picture,
      idCharacterDrawPath: null == idCharacterDrawPath
          ? _value.idCharacterDrawPath
          : idCharacterDrawPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterDrawPictureCopyWith<$Res>
    implements $CharacterDrawPictureCopyWith<$Res> {
  factory _$$_CharacterDrawPictureCopyWith(_$_CharacterDrawPicture value,
          $Res Function(_$_CharacterDrawPicture) then) =
      __$$_CharacterDrawPictureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ui.Picture picture, String idCharacterDrawPath});
}

/// @nodoc
class __$$_CharacterDrawPictureCopyWithImpl<$Res>
    extends _$CharacterDrawPictureCopyWithImpl<$Res, _$_CharacterDrawPicture>
    implements _$$_CharacterDrawPictureCopyWith<$Res> {
  __$$_CharacterDrawPictureCopyWithImpl(_$_CharacterDrawPicture _value,
      $Res Function(_$_CharacterDrawPicture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? picture = null,
    Object? idCharacterDrawPath = null,
  }) {
    return _then(_$_CharacterDrawPicture(
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as ui.Picture,
      idCharacterDrawPath: null == idCharacterDrawPath
          ? _value.idCharacterDrawPath
          : idCharacterDrawPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CharacterDrawPicture implements _CharacterDrawPicture {
  const _$_CharacterDrawPicture(
      {required this.picture, required this.idCharacterDrawPath});

  @override
  final ui.Picture picture;
  @override
  final String idCharacterDrawPath;

  @override
  String toString() {
    return 'CharacterDrawPicture(picture: $picture, idCharacterDrawPath: $idCharacterDrawPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterDrawPicture &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.idCharacterDrawPath, idCharacterDrawPath) ||
                other.idCharacterDrawPath == idCharacterDrawPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, picture, idCharacterDrawPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterDrawPictureCopyWith<_$_CharacterDrawPicture> get copyWith =>
      __$$_CharacterDrawPictureCopyWithImpl<_$_CharacterDrawPicture>(
          this, _$identity);
}

abstract class _CharacterDrawPicture implements CharacterDrawPicture {
  const factory _CharacterDrawPicture(
      {required final ui.Picture picture,
      required final String idCharacterDrawPath}) = _$_CharacterDrawPicture;

  @override
  ui.Picture get picture;
  @override
  String get idCharacterDrawPath;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterDrawPictureCopyWith<_$_CharacterDrawPicture> get copyWith =>
      throw _privateConstructorUsedError;
}
