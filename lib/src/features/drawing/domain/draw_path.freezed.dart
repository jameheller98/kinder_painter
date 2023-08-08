// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draw_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DrawPath _$DrawPathFromJson(Map<String, dynamic> json) {
  return _DrawPath.fromJson(json);
}

/// @nodoc
mixin _$DrawPath {
  String get id => throw _privateConstructorUsedError;
  @OffsetJsonConverter()
  List<Offset> get points => throw _privateConstructorUsedError;
  Paintbrush get paintbrush => throw _privateConstructorUsedError;
  int get indexCharacterPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrawPathCopyWith<DrawPath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawPathCopyWith<$Res> {
  factory $DrawPathCopyWith(DrawPath value, $Res Function(DrawPath) then) =
      _$DrawPathCopyWithImpl<$Res, DrawPath>;
  @useResult
  $Res call(
      {String id,
      @OffsetJsonConverter() List<Offset> points,
      Paintbrush paintbrush,
      int indexCharacterPath});

  $PaintbrushCopyWith<$Res> get paintbrush;
}

/// @nodoc
class _$DrawPathCopyWithImpl<$Res, $Val extends DrawPath>
    implements $DrawPathCopyWith<$Res> {
  _$DrawPathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? paintbrush = null,
    Object? indexCharacterPath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      paintbrush: null == paintbrush
          ? _value.paintbrush
          : paintbrush // ignore: cast_nullable_to_non_nullable
              as Paintbrush,
      indexCharacterPath: null == indexCharacterPath
          ? _value.indexCharacterPath
          : indexCharacterPath // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaintbrushCopyWith<$Res> get paintbrush {
    return $PaintbrushCopyWith<$Res>(_value.paintbrush, (value) {
      return _then(_value.copyWith(paintbrush: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DrawPathCopyWith<$Res> implements $DrawPathCopyWith<$Res> {
  factory _$$_DrawPathCopyWith(
          _$_DrawPath value, $Res Function(_$_DrawPath) then) =
      __$$_DrawPathCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @OffsetJsonConverter() List<Offset> points,
      Paintbrush paintbrush,
      int indexCharacterPath});

  @override
  $PaintbrushCopyWith<$Res> get paintbrush;
}

/// @nodoc
class __$$_DrawPathCopyWithImpl<$Res>
    extends _$DrawPathCopyWithImpl<$Res, _$_DrawPath>
    implements _$$_DrawPathCopyWith<$Res> {
  __$$_DrawPathCopyWithImpl(
      _$_DrawPath _value, $Res Function(_$_DrawPath) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? points = null,
    Object? paintbrush = null,
    Object? indexCharacterPath = null,
  }) {
    return _then(_$_DrawPath(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      paintbrush: null == paintbrush
          ? _value.paintbrush
          : paintbrush // ignore: cast_nullable_to_non_nullable
              as Paintbrush,
      indexCharacterPath: null == indexCharacterPath
          ? _value.indexCharacterPath
          : indexCharacterPath // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DrawPath implements _DrawPath {
  const _$_DrawPath(
      {required this.id,
      @OffsetJsonConverter() final List<Offset> points = const [],
      required this.paintbrush,
      required this.indexCharacterPath})
      : _points = points;

  factory _$_DrawPath.fromJson(Map<String, dynamic> json) =>
      _$$_DrawPathFromJson(json);

  @override
  final String id;
  final List<Offset> _points;
  @override
  @JsonKey()
  @OffsetJsonConverter()
  List<Offset> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final Paintbrush paintbrush;
  @override
  final int indexCharacterPath;

  @override
  String toString() {
    return 'DrawPath(id: $id, points: $points, paintbrush: $paintbrush, indexCharacterPath: $indexCharacterPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrawPath &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.paintbrush, paintbrush) ||
                other.paintbrush == paintbrush) &&
            (identical(other.indexCharacterPath, indexCharacterPath) ||
                other.indexCharacterPath == indexCharacterPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_points),
      paintbrush,
      indexCharacterPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DrawPathCopyWith<_$_DrawPath> get copyWith =>
      __$$_DrawPathCopyWithImpl<_$_DrawPath>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrawPathToJson(
      this,
    );
  }
}

abstract class _DrawPath implements DrawPath {
  const factory _DrawPath(
      {required final String id,
      @OffsetJsonConverter() final List<Offset> points,
      required final Paintbrush paintbrush,
      required final int indexCharacterPath}) = _$_DrawPath;

  factory _DrawPath.fromJson(Map<String, dynamic> json) = _$_DrawPath.fromJson;

  @override
  String get id;
  @override
  @OffsetJsonConverter()
  List<Offset> get points;
  @override
  Paintbrush get paintbrush;
  @override
  int get indexCharacterPath;
  @override
  @JsonKey(ignore: true)
  _$$_DrawPathCopyWith<_$_DrawPath> get copyWith =>
      throw _privateConstructorUsedError;
}
