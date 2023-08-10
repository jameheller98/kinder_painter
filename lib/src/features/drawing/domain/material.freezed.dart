// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Material _$MaterialFromJson(Map<String, dynamic> json) {
  return _Material.fromJson(json);
}

/// @nodoc
mixin _$Material {
  int get id => throw _privateConstructorUsedError;
  TypeMaterial get type => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int get indexDrawMaterialActive => throw _privateConstructorUsedError;
  List<DrawColor> get colors => throw _privateConstructorUsedError;
  List<DrawPattern> get patterns => throw _privateConstructorUsedError;
  List<DrawSticker> get stickers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialCopyWith<Material> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialCopyWith<$Res> {
  factory $MaterialCopyWith(Material value, $Res Function(Material) then) =
      _$MaterialCopyWithImpl<$Res, Material>;
  @useResult
  $Res call(
      {int id,
      TypeMaterial type,
      @JsonKey(includeFromJson: false, includeToJson: false) bool isActive,
      @JsonKey(includeFromJson: false, includeToJson: false)
      int indexDrawMaterialActive,
      List<DrawColor> colors,
      List<DrawPattern> patterns,
      List<DrawSticker> stickers});
}

/// @nodoc
class _$MaterialCopyWithImpl<$Res, $Val extends Material>
    implements $MaterialCopyWith<$Res> {
  _$MaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? isActive = null,
    Object? indexDrawMaterialActive = null,
    Object? colors = null,
    Object? patterns = null,
    Object? stickers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeMaterial,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      indexDrawMaterialActive: null == indexDrawMaterialActive
          ? _value.indexDrawMaterialActive
          : indexDrawMaterialActive // ignore: cast_nullable_to_non_nullable
              as int,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<DrawColor>,
      patterns: null == patterns
          ? _value.patterns
          : patterns // ignore: cast_nullable_to_non_nullable
              as List<DrawPattern>,
      stickers: null == stickers
          ? _value.stickers
          : stickers // ignore: cast_nullable_to_non_nullable
              as List<DrawSticker>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialCopyWith<$Res> implements $MaterialCopyWith<$Res> {
  factory _$$_MaterialCopyWith(
          _$_Material value, $Res Function(_$_Material) then) =
      __$$_MaterialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      TypeMaterial type,
      @JsonKey(includeFromJson: false, includeToJson: false) bool isActive,
      @JsonKey(includeFromJson: false, includeToJson: false)
      int indexDrawMaterialActive,
      List<DrawColor> colors,
      List<DrawPattern> patterns,
      List<DrawSticker> stickers});
}

/// @nodoc
class __$$_MaterialCopyWithImpl<$Res>
    extends _$MaterialCopyWithImpl<$Res, _$_Material>
    implements _$$_MaterialCopyWith<$Res> {
  __$$_MaterialCopyWithImpl(
      _$_Material _value, $Res Function(_$_Material) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? isActive = null,
    Object? indexDrawMaterialActive = null,
    Object? colors = null,
    Object? patterns = null,
    Object? stickers = null,
  }) {
    return _then(_$_Material(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeMaterial,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      indexDrawMaterialActive: null == indexDrawMaterialActive
          ? _value.indexDrawMaterialActive
          : indexDrawMaterialActive // ignore: cast_nullable_to_non_nullable
              as int,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<DrawColor>,
      patterns: null == patterns
          ? _value._patterns
          : patterns // ignore: cast_nullable_to_non_nullable
              as List<DrawPattern>,
      stickers: null == stickers
          ? _value._stickers
          : stickers // ignore: cast_nullable_to_non_nullable
              as List<DrawSticker>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Material extends _Material {
  const _$_Material(
      {required this.id,
      required this.type,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.isActive = false,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.indexDrawMaterialActive = 0,
      final List<DrawColor> colors = const [],
      final List<DrawPattern> patterns = const [],
      final List<DrawSticker> stickers = const []})
      : _colors = colors,
        _patterns = patterns,
        _stickers = stickers,
        super._();

  factory _$_Material.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialFromJson(json);

  @override
  final int id;
  @override
  final TypeMaterial type;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isActive;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int indexDrawMaterialActive;
  final List<DrawColor> _colors;
  @override
  @JsonKey()
  List<DrawColor> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  final List<DrawPattern> _patterns;
  @override
  @JsonKey()
  List<DrawPattern> get patterns {
    if (_patterns is EqualUnmodifiableListView) return _patterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patterns);
  }

  final List<DrawSticker> _stickers;
  @override
  @JsonKey()
  List<DrawSticker> get stickers {
    if (_stickers is EqualUnmodifiableListView) return _stickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stickers);
  }

  @override
  String toString() {
    return 'Material(id: $id, type: $type, isActive: $isActive, indexDrawMaterialActive: $indexDrawMaterialActive, colors: $colors, patterns: $patterns, stickers: $stickers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Material &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(
                    other.indexDrawMaterialActive, indexDrawMaterialActive) ||
                other.indexDrawMaterialActive == indexDrawMaterialActive) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            const DeepCollectionEquality().equals(other._patterns, _patterns) &&
            const DeepCollectionEquality().equals(other._stickers, _stickers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      isActive,
      indexDrawMaterialActive,
      const DeepCollectionEquality().hash(_colors),
      const DeepCollectionEquality().hash(_patterns),
      const DeepCollectionEquality().hash(_stickers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialCopyWith<_$_Material> get copyWith =>
      __$$_MaterialCopyWithImpl<_$_Material>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialToJson(
      this,
    );
  }
}

abstract class _Material extends Material {
  const factory _Material(
      {required final int id,
      required final TypeMaterial type,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool isActive,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final int indexDrawMaterialActive,
      final List<DrawColor> colors,
      final List<DrawPattern> patterns,
      final List<DrawSticker> stickers}) = _$_Material;
  const _Material._() : super._();

  factory _Material.fromJson(Map<String, dynamic> json) = _$_Material.fromJson;

  @override
  int get id;
  @override
  TypeMaterial get type;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isActive;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int get indexDrawMaterialActive;
  @override
  List<DrawColor> get colors;
  @override
  List<DrawPattern> get patterns;
  @override
  List<DrawSticker> get stickers;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialCopyWith<_$_Material> get copyWith =>
      throw _privateConstructorUsedError;
}
