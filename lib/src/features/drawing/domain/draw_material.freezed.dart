// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draw_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrawMaterial {
  Material get currentMaterial => throw _privateConstructorUsedError;
  List<Material> get materials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawMaterialCopyWith<DrawMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawMaterialCopyWith<$Res> {
  factory $DrawMaterialCopyWith(
          DrawMaterial value, $Res Function(DrawMaterial) then) =
      _$DrawMaterialCopyWithImpl<$Res, DrawMaterial>;
  @useResult
  $Res call({Material currentMaterial, List<Material> materials});

  $MaterialCopyWith<$Res> get currentMaterial;
}

/// @nodoc
class _$DrawMaterialCopyWithImpl<$Res, $Val extends DrawMaterial>
    implements $DrawMaterialCopyWith<$Res> {
  _$DrawMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentMaterial = null,
    Object? materials = null,
  }) {
    return _then(_value.copyWith(
      currentMaterial: null == currentMaterial
          ? _value.currentMaterial
          : currentMaterial // ignore: cast_nullable_to_non_nullable
              as Material,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<Material>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get currentMaterial {
    return $MaterialCopyWith<$Res>(_value.currentMaterial, (value) {
      return _then(_value.copyWith(currentMaterial: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DrawMaterialCopyWith<$Res>
    implements $DrawMaterialCopyWith<$Res> {
  factory _$$_DrawMaterialCopyWith(
          _$_DrawMaterial value, $Res Function(_$_DrawMaterial) then) =
      __$$_DrawMaterialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Material currentMaterial, List<Material> materials});

  @override
  $MaterialCopyWith<$Res> get currentMaterial;
}

/// @nodoc
class __$$_DrawMaterialCopyWithImpl<$Res>
    extends _$DrawMaterialCopyWithImpl<$Res, _$_DrawMaterial>
    implements _$$_DrawMaterialCopyWith<$Res> {
  __$$_DrawMaterialCopyWithImpl(
      _$_DrawMaterial _value, $Res Function(_$_DrawMaterial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentMaterial = null,
    Object? materials = null,
  }) {
    return _then(_$_DrawMaterial(
      currentMaterial: null == currentMaterial
          ? _value.currentMaterial
          : currentMaterial // ignore: cast_nullable_to_non_nullable
              as Material,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<Material>,
    ));
  }
}

/// @nodoc

class _$_DrawMaterial implements _DrawMaterial {
  const _$_DrawMaterial(
      {required this.currentMaterial, required final List<Material> materials})
      : _materials = materials;

  @override
  final Material currentMaterial;
  final List<Material> _materials;
  @override
  List<Material> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'DrawMaterial(currentMaterial: $currentMaterial, materials: $materials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrawMaterial &&
            (identical(other.currentMaterial, currentMaterial) ||
                other.currentMaterial == currentMaterial) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentMaterial,
      const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DrawMaterialCopyWith<_$_DrawMaterial> get copyWith =>
      __$$_DrawMaterialCopyWithImpl<_$_DrawMaterial>(this, _$identity);
}

abstract class _DrawMaterial implements DrawMaterial {
  const factory _DrawMaterial(
      {required final Material currentMaterial,
      required final List<Material> materials}) = _$_DrawMaterial;

  @override
  Material get currentMaterial;
  @override
  List<Material> get materials;
  @override
  @JsonKey(ignore: true)
  _$$_DrawMaterialCopyWith<_$_DrawMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}
