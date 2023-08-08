// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_draw_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterDrawPath _$CharacterDrawPathFromJson(Map<String, dynamic> json) {
  return _CharacterDrawPath.fromJson(json);
}

/// @nodoc
mixin _$CharacterDrawPath {
  String get id => throw _privateConstructorUsedError;
  @PathJsonConverter()
  Path get characterPath => throw _privateConstructorUsedError;
  @Uint8ListJsonConverter()
  Uint8List? get unit8ListImage => throw _privateConstructorUsedError;
  List<DrawPath> get drawPaths => throw _privateConstructorUsedError;
  @ColorJsonConverter()
  Color? get fill => throw _privateConstructorUsedError;
  Stroke? get stroke => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterDrawPathCopyWith<CharacterDrawPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDrawPathCopyWith<$Res> {
  factory $CharacterDrawPathCopyWith(
          CharacterDrawPath value, $Res Function(CharacterDrawPath) then) =
      _$CharacterDrawPathCopyWithImpl<$Res, CharacterDrawPath>;
  @useResult
  $Res call(
      {String id,
      @PathJsonConverter() Path characterPath,
      @Uint8ListJsonConverter() Uint8List? unit8ListImage,
      List<DrawPath> drawPaths,
      @ColorJsonConverter() Color? fill,
      Stroke? stroke});

  $StrokeCopyWith<$Res>? get stroke;
}

/// @nodoc
class _$CharacterDrawPathCopyWithImpl<$Res, $Val extends CharacterDrawPath>
    implements $CharacterDrawPathCopyWith<$Res> {
  _$CharacterDrawPathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? characterPath = null,
    Object? unit8ListImage = freezed,
    Object? drawPaths = null,
    Object? fill = freezed,
    Object? stroke = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      characterPath: null == characterPath
          ? _value.characterPath
          : characterPath // ignore: cast_nullable_to_non_nullable
              as Path,
      unit8ListImage: freezed == unit8ListImage
          ? _value.unit8ListImage
          : unit8ListImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      drawPaths: null == drawPaths
          ? _value.drawPaths
          : drawPaths // ignore: cast_nullable_to_non_nullable
              as List<DrawPath>,
      fill: freezed == fill
          ? _value.fill
          : fill // ignore: cast_nullable_to_non_nullable
              as Color?,
      stroke: freezed == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as Stroke?,
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
abstract class _$$_CharacterDrawPathCopyWith<$Res>
    implements $CharacterDrawPathCopyWith<$Res> {
  factory _$$_CharacterDrawPathCopyWith(_$_CharacterDrawPath value,
          $Res Function(_$_CharacterDrawPath) then) =
      __$$_CharacterDrawPathCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @PathJsonConverter() Path characterPath,
      @Uint8ListJsonConverter() Uint8List? unit8ListImage,
      List<DrawPath> drawPaths,
      @ColorJsonConverter() Color? fill,
      Stroke? stroke});

  @override
  $StrokeCopyWith<$Res>? get stroke;
}

/// @nodoc
class __$$_CharacterDrawPathCopyWithImpl<$Res>
    extends _$CharacterDrawPathCopyWithImpl<$Res, _$_CharacterDrawPath>
    implements _$$_CharacterDrawPathCopyWith<$Res> {
  __$$_CharacterDrawPathCopyWithImpl(
      _$_CharacterDrawPath _value, $Res Function(_$_CharacterDrawPath) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? characterPath = null,
    Object? unit8ListImage = freezed,
    Object? drawPaths = null,
    Object? fill = freezed,
    Object? stroke = freezed,
  }) {
    return _then(_$_CharacterDrawPath(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      characterPath: null == characterPath
          ? _value.characterPath
          : characterPath // ignore: cast_nullable_to_non_nullable
              as Path,
      unit8ListImage: freezed == unit8ListImage
          ? _value.unit8ListImage
          : unit8ListImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      drawPaths: null == drawPaths
          ? _value._drawPaths
          : drawPaths // ignore: cast_nullable_to_non_nullable
              as List<DrawPath>,
      fill: freezed == fill
          ? _value.fill
          : fill // ignore: cast_nullable_to_non_nullable
              as Color?,
      stroke: freezed == stroke
          ? _value.stroke
          : stroke // ignore: cast_nullable_to_non_nullable
              as Stroke?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterDrawPath implements _CharacterDrawPath {
  const _$_CharacterDrawPath(
      {required this.id,
      @PathJsonConverter() required this.characterPath,
      @Uint8ListJsonConverter() this.unit8ListImage,
      final List<DrawPath> drawPaths = const [],
      @ColorJsonConverter() this.fill,
      this.stroke})
      : _drawPaths = drawPaths;

  factory _$_CharacterDrawPath.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterDrawPathFromJson(json);

  @override
  final String id;
  @override
  @PathJsonConverter()
  final Path characterPath;
  @override
  @Uint8ListJsonConverter()
  final Uint8List? unit8ListImage;
  final List<DrawPath> _drawPaths;
  @override
  @JsonKey()
  List<DrawPath> get drawPaths {
    if (_drawPaths is EqualUnmodifiableListView) return _drawPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drawPaths);
  }

  @override
  @ColorJsonConverter()
  final Color? fill;
  @override
  final Stroke? stroke;

  @override
  String toString() {
    return 'CharacterDrawPath(id: $id, characterPath: $characterPath, unit8ListImage: $unit8ListImage, drawPaths: $drawPaths, fill: $fill, stroke: $stroke)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterDrawPath &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.characterPath, characterPath) ||
                other.characterPath == characterPath) &&
            const DeepCollectionEquality()
                .equals(other.unit8ListImage, unit8ListImage) &&
            const DeepCollectionEquality()
                .equals(other._drawPaths, _drawPaths) &&
            (identical(other.fill, fill) || other.fill == fill) &&
            (identical(other.stroke, stroke) || other.stroke == stroke));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      characterPath,
      const DeepCollectionEquality().hash(unit8ListImage),
      const DeepCollectionEquality().hash(_drawPaths),
      fill,
      stroke);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterDrawPathCopyWith<_$_CharacterDrawPath> get copyWith =>
      __$$_CharacterDrawPathCopyWithImpl<_$_CharacterDrawPath>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterDrawPathToJson(
      this,
    );
  }
}

abstract class _CharacterDrawPath implements CharacterDrawPath {
  const factory _CharacterDrawPath(
      {required final String id,
      @PathJsonConverter() required final Path characterPath,
      @Uint8ListJsonConverter() final Uint8List? unit8ListImage,
      final List<DrawPath> drawPaths,
      @ColorJsonConverter() final Color? fill,
      final Stroke? stroke}) = _$_CharacterDrawPath;

  factory _CharacterDrawPath.fromJson(Map<String, dynamic> json) =
      _$_CharacterDrawPath.fromJson;

  @override
  String get id;
  @override
  @PathJsonConverter()
  Path get characterPath;
  @override
  @Uint8ListJsonConverter()
  Uint8List? get unit8ListImage;
  @override
  List<DrawPath> get drawPaths;
  @override
  @ColorJsonConverter()
  Color? get fill;
  @override
  Stroke? get stroke;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterDrawPathCopyWith<_$_CharacterDrawPath> get copyWith =>
      throw _privateConstructorUsedError;
}
