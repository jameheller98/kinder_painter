// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draw.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Draw _$DrawFromJson(Map<String, dynamic> json) {
  return _Draw.fromJson(json);
}

/// @nodoc
mixin _$Draw {
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isDrawing => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  stack.Stack<DrawPath>? get drewPathStack =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  stack.Stack<DrawPath>? get undidPathStack =>
      throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  DrawPath? get currentDrawPath => throw _privateConstructorUsedError;
  CharacterDraw get characterDraw => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrawCopyWith<Draw> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawCopyWith<$Res> {
  factory $DrawCopyWith(Draw value, $Res Function(Draw) then) =
      _$DrawCopyWithImpl<$Res, Draw>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) bool isDrawing,
      @JsonKey(includeFromJson: false, includeToJson: false)
      stack.Stack<DrawPath>? drewPathStack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      stack.Stack<DrawPath>? undidPathStack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DrawPath? currentDrawPath,
      CharacterDraw characterDraw});

  $DrawPathCopyWith<$Res>? get currentDrawPath;
  $CharacterDrawCopyWith<$Res> get characterDraw;
}

/// @nodoc
class _$DrawCopyWithImpl<$Res, $Val extends Draw>
    implements $DrawCopyWith<$Res> {
  _$DrawCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDrawing = null,
    Object? drewPathStack = freezed,
    Object? undidPathStack = freezed,
    Object? currentDrawPath = freezed,
    Object? characterDraw = null,
  }) {
    return _then(_value.copyWith(
      isDrawing: null == isDrawing
          ? _value.isDrawing
          : isDrawing // ignore: cast_nullable_to_non_nullable
              as bool,
      drewPathStack: freezed == drewPathStack
          ? _value.drewPathStack
          : drewPathStack // ignore: cast_nullable_to_non_nullable
              as stack.Stack<DrawPath>?,
      undidPathStack: freezed == undidPathStack
          ? _value.undidPathStack
          : undidPathStack // ignore: cast_nullable_to_non_nullable
              as stack.Stack<DrawPath>?,
      currentDrawPath: freezed == currentDrawPath
          ? _value.currentDrawPath
          : currentDrawPath // ignore: cast_nullable_to_non_nullable
              as DrawPath?,
      characterDraw: null == characterDraw
          ? _value.characterDraw
          : characterDraw // ignore: cast_nullable_to_non_nullable
              as CharacterDraw,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DrawPathCopyWith<$Res>? get currentDrawPath {
    if (_value.currentDrawPath == null) {
      return null;
    }

    return $DrawPathCopyWith<$Res>(_value.currentDrawPath!, (value) {
      return _then(_value.copyWith(currentDrawPath: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterDrawCopyWith<$Res> get characterDraw {
    return $CharacterDrawCopyWith<$Res>(_value.characterDraw, (value) {
      return _then(_value.copyWith(characterDraw: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DrawCopyWith<$Res> implements $DrawCopyWith<$Res> {
  factory _$$_DrawCopyWith(_$_Draw value, $Res Function(_$_Draw) then) =
      __$$_DrawCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) bool isDrawing,
      @JsonKey(includeFromJson: false, includeToJson: false)
      stack.Stack<DrawPath>? drewPathStack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      stack.Stack<DrawPath>? undidPathStack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DrawPath? currentDrawPath,
      CharacterDraw characterDraw});

  @override
  $DrawPathCopyWith<$Res>? get currentDrawPath;
  @override
  $CharacterDrawCopyWith<$Res> get characterDraw;
}

/// @nodoc
class __$$_DrawCopyWithImpl<$Res> extends _$DrawCopyWithImpl<$Res, _$_Draw>
    implements _$$_DrawCopyWith<$Res> {
  __$$_DrawCopyWithImpl(_$_Draw _value, $Res Function(_$_Draw) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDrawing = null,
    Object? drewPathStack = freezed,
    Object? undidPathStack = freezed,
    Object? currentDrawPath = freezed,
    Object? characterDraw = null,
  }) {
    return _then(_$_Draw(
      isDrawing: null == isDrawing
          ? _value.isDrawing
          : isDrawing // ignore: cast_nullable_to_non_nullable
              as bool,
      drewPathStack: freezed == drewPathStack
          ? _value.drewPathStack
          : drewPathStack // ignore: cast_nullable_to_non_nullable
              as stack.Stack<DrawPath>?,
      undidPathStack: freezed == undidPathStack
          ? _value.undidPathStack
          : undidPathStack // ignore: cast_nullable_to_non_nullable
              as stack.Stack<DrawPath>?,
      currentDrawPath: freezed == currentDrawPath
          ? _value.currentDrawPath
          : currentDrawPath // ignore: cast_nullable_to_non_nullable
              as DrawPath?,
      characterDraw: null == characterDraw
          ? _value.characterDraw
          : characterDraw // ignore: cast_nullable_to_non_nullable
              as CharacterDraw,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Draw implements _Draw {
  const _$_Draw(
      {@JsonKey(includeFromJson: false, includeToJson: false)
      this.isDrawing = false,
      @JsonKey(includeFromJson: false, includeToJson: false) this.drewPathStack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.undidPathStack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.currentDrawPath,
      required this.characterDraw});

  factory _$_Draw.fromJson(Map<String, dynamic> json) => _$$_DrawFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isDrawing;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final stack.Stack<DrawPath>? drewPathStack;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final stack.Stack<DrawPath>? undidPathStack;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DrawPath? currentDrawPath;
  @override
  final CharacterDraw characterDraw;

  @override
  String toString() {
    return 'Draw(isDrawing: $isDrawing, drewPathStack: $drewPathStack, undidPathStack: $undidPathStack, currentDrawPath: $currentDrawPath, characterDraw: $characterDraw)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Draw &&
            (identical(other.isDrawing, isDrawing) ||
                other.isDrawing == isDrawing) &&
            (identical(other.drewPathStack, drewPathStack) ||
                other.drewPathStack == drewPathStack) &&
            (identical(other.undidPathStack, undidPathStack) ||
                other.undidPathStack == undidPathStack) &&
            (identical(other.currentDrawPath, currentDrawPath) ||
                other.currentDrawPath == currentDrawPath) &&
            (identical(other.characterDraw, characterDraw) ||
                other.characterDraw == characterDraw));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isDrawing, drewPathStack,
      undidPathStack, currentDrawPath, characterDraw);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DrawCopyWith<_$_Draw> get copyWith =>
      __$$_DrawCopyWithImpl<_$_Draw>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrawToJson(
      this,
    );
  }
}

abstract class _Draw implements Draw {
  const factory _Draw(
      {@JsonKey(includeFromJson: false, includeToJson: false)
      final bool isDrawing,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final stack.Stack<DrawPath>? drewPathStack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final stack.Stack<DrawPath>? undidPathStack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final DrawPath? currentDrawPath,
      required final CharacterDraw characterDraw}) = _$_Draw;

  factory _Draw.fromJson(Map<String, dynamic> json) = _$_Draw.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isDrawing;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  stack.Stack<DrawPath>? get drewPathStack;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  stack.Stack<DrawPath>? get undidPathStack;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DrawPath? get currentDrawPath;
  @override
  CharacterDraw get characterDraw;
  @override
  @JsonKey(ignore: true)
  _$$_DrawCopyWith<_$_Draw> get copyWith => throw _privateConstructorUsedError;
}
