// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_draw.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterDraw _$CharacterDrawFromJson(Map<String, dynamic> json) {
  return _CharacterDraw.fromJson(json);
}

/// @nodoc
mixin _$CharacterDraw {
  String get id => throw _privateConstructorUsedError;
  List<CharacterDrawPath> get characterDrawPaths =>
      throw _privateConstructorUsedError;
  @CharacterBackgroundJsonConverter()
  CharacterDrawBackground get backgroundDrawPaths =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterDrawCopyWith<CharacterDraw> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDrawCopyWith<$Res> {
  factory $CharacterDrawCopyWith(
          CharacterDraw value, $Res Function(CharacterDraw) then) =
      _$CharacterDrawCopyWithImpl<$Res, CharacterDraw>;
  @useResult
  $Res call(
      {String id,
      List<CharacterDrawPath> characterDrawPaths,
      @CharacterBackgroundJsonConverter()
      CharacterDrawBackground backgroundDrawPaths});

  $CharacterDrawBackgroundCopyWith<$Res> get backgroundDrawPaths;
}

/// @nodoc
class _$CharacterDrawCopyWithImpl<$Res, $Val extends CharacterDraw>
    implements $CharacterDrawCopyWith<$Res> {
  _$CharacterDrawCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? characterDrawPaths = null,
    Object? backgroundDrawPaths = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      characterDrawPaths: null == characterDrawPaths
          ? _value.characterDrawPaths
          : characterDrawPaths // ignore: cast_nullable_to_non_nullable
              as List<CharacterDrawPath>,
      backgroundDrawPaths: null == backgroundDrawPaths
          ? _value.backgroundDrawPaths
          : backgroundDrawPaths // ignore: cast_nullable_to_non_nullable
              as CharacterDrawBackground,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterDrawBackgroundCopyWith<$Res> get backgroundDrawPaths {
    return $CharacterDrawBackgroundCopyWith<$Res>(_value.backgroundDrawPaths,
        (value) {
      return _then(_value.copyWith(backgroundDrawPaths: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharacterDrawCopyWith<$Res>
    implements $CharacterDrawCopyWith<$Res> {
  factory _$$_CharacterDrawCopyWith(
          _$_CharacterDraw value, $Res Function(_$_CharacterDraw) then) =
      __$$_CharacterDrawCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<CharacterDrawPath> characterDrawPaths,
      @CharacterBackgroundJsonConverter()
      CharacterDrawBackground backgroundDrawPaths});

  @override
  $CharacterDrawBackgroundCopyWith<$Res> get backgroundDrawPaths;
}

/// @nodoc
class __$$_CharacterDrawCopyWithImpl<$Res>
    extends _$CharacterDrawCopyWithImpl<$Res, _$_CharacterDraw>
    implements _$$_CharacterDrawCopyWith<$Res> {
  __$$_CharacterDrawCopyWithImpl(
      _$_CharacterDraw _value, $Res Function(_$_CharacterDraw) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? characterDrawPaths = null,
    Object? backgroundDrawPaths = null,
  }) {
    return _then(_$_CharacterDraw(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      characterDrawPaths: null == characterDrawPaths
          ? _value._characterDrawPaths
          : characterDrawPaths // ignore: cast_nullable_to_non_nullable
              as List<CharacterDrawPath>,
      backgroundDrawPaths: null == backgroundDrawPaths
          ? _value.backgroundDrawPaths
          : backgroundDrawPaths // ignore: cast_nullable_to_non_nullable
              as CharacterDrawBackground,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterDraw extends _CharacterDraw {
  const _$_CharacterDraw(
      {required this.id,
      final List<CharacterDrawPath> characterDrawPaths = const [],
      @CharacterBackgroundJsonConverter() required this.backgroundDrawPaths})
      : _characterDrawPaths = characterDrawPaths,
        super._();

  factory _$_CharacterDraw.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterDrawFromJson(json);

  @override
  final String id;
  final List<CharacterDrawPath> _characterDrawPaths;
  @override
  @JsonKey()
  List<CharacterDrawPath> get characterDrawPaths {
    if (_characterDrawPaths is EqualUnmodifiableListView)
      return _characterDrawPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characterDrawPaths);
  }

  @override
  @CharacterBackgroundJsonConverter()
  final CharacterDrawBackground backgroundDrawPaths;

  @override
  String toString() {
    return 'CharacterDraw(id: $id, characterDrawPaths: $characterDrawPaths, backgroundDrawPaths: $backgroundDrawPaths)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterDraw &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._characterDrawPaths, _characterDrawPaths) &&
            (identical(other.backgroundDrawPaths, backgroundDrawPaths) ||
                other.backgroundDrawPaths == backgroundDrawPaths));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_characterDrawPaths),
      backgroundDrawPaths);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterDrawCopyWith<_$_CharacterDraw> get copyWith =>
      __$$_CharacterDrawCopyWithImpl<_$_CharacterDraw>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterDrawToJson(
      this,
    );
  }
}

abstract class _CharacterDraw extends CharacterDraw {
  const factory _CharacterDraw(
          {required final String id,
          final List<CharacterDrawPath> characterDrawPaths,
          @CharacterBackgroundJsonConverter()
          required final CharacterDrawBackground backgroundDrawPaths}) =
      _$_CharacterDraw;
  const _CharacterDraw._() : super._();

  factory _CharacterDraw.fromJson(Map<String, dynamic> json) =
      _$_CharacterDraw.fromJson;

  @override
  String get id;
  @override
  List<CharacterDrawPath> get characterDrawPaths;
  @override
  @CharacterBackgroundJsonConverter()
  CharacterDrawBackground get backgroundDrawPaths;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterDrawCopyWith<_$_CharacterDraw> get copyWith =>
      throw _privateConstructorUsedError;
}
