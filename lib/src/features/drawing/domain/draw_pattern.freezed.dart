// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draw_pattern.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DrawPattern {
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawPatternCopyWith<DrawPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawPatternCopyWith<$Res> {
  factory $DrawPatternCopyWith(
          DrawPattern value, $Res Function(DrawPattern) then) =
      _$DrawPatternCopyWithImpl<$Res, DrawPattern>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DrawPatternCopyWithImpl<$Res, $Val extends DrawPattern>
    implements $DrawPatternCopyWith<$Res> {
  _$DrawPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DrawPatternCopyWith<$Res>
    implements $DrawPatternCopyWith<$Res> {
  factory _$$_DrawPatternCopyWith(
          _$_DrawPattern value, $Res Function(_$_DrawPattern) then) =
      __$$_DrawPatternCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_DrawPatternCopyWithImpl<$Res>
    extends _$DrawPatternCopyWithImpl<$Res, _$_DrawPattern>
    implements _$$_DrawPatternCopyWith<$Res> {
  __$$_DrawPatternCopyWithImpl(
      _$_DrawPattern _value, $Res Function(_$_DrawPattern) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_DrawPattern(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DrawPattern implements _DrawPattern {
  const _$_DrawPattern({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'DrawPattern(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DrawPattern &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DrawPatternCopyWith<_$_DrawPattern> get copyWith =>
      __$$_DrawPatternCopyWithImpl<_$_DrawPattern>(this, _$identity);
}

abstract class _DrawPattern implements DrawPattern {
  const factory _DrawPattern({required final int id}) = _$_DrawPattern;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_DrawPatternCopyWith<_$_DrawPattern> get copyWith =>
      throw _privateConstructorUsedError;
}
