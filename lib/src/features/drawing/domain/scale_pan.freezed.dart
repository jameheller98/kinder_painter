// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scale_pan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScalePan {
  double get ratioScale => throw _privateConstructorUsedError;
  double get tempRatioScale => throw _privateConstructorUsedError;
  bool get isScalingAndPan => throw _privateConstructorUsedError;
  Offset get focalPoint => throw _privateConstructorUsedError;
  Offset get tempPanDistance => throw _privateConstructorUsedError;
  Offset get panDistance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScalePanCopyWith<ScalePan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScalePanCopyWith<$Res> {
  factory $ScalePanCopyWith(ScalePan value, $Res Function(ScalePan) then) =
      _$ScalePanCopyWithImpl<$Res, ScalePan>;
  @useResult
  $Res call(
      {double ratioScale,
      double tempRatioScale,
      bool isScalingAndPan,
      Offset focalPoint,
      Offset tempPanDistance,
      Offset panDistance});
}

/// @nodoc
class _$ScalePanCopyWithImpl<$Res, $Val extends ScalePan>
    implements $ScalePanCopyWith<$Res> {
  _$ScalePanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratioScale = null,
    Object? tempRatioScale = null,
    Object? isScalingAndPan = null,
    Object? focalPoint = null,
    Object? tempPanDistance = null,
    Object? panDistance = null,
  }) {
    return _then(_value.copyWith(
      ratioScale: null == ratioScale
          ? _value.ratioScale
          : ratioScale // ignore: cast_nullable_to_non_nullable
              as double,
      tempRatioScale: null == tempRatioScale
          ? _value.tempRatioScale
          : tempRatioScale // ignore: cast_nullable_to_non_nullable
              as double,
      isScalingAndPan: null == isScalingAndPan
          ? _value.isScalingAndPan
          : isScalingAndPan // ignore: cast_nullable_to_non_nullable
              as bool,
      focalPoint: null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      tempPanDistance: null == tempPanDistance
          ? _value.tempPanDistance
          : tempPanDistance // ignore: cast_nullable_to_non_nullable
              as Offset,
      panDistance: null == panDistance
          ? _value.panDistance
          : panDistance // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScalePanCopyWith<$Res> implements $ScalePanCopyWith<$Res> {
  factory _$$_ScalePanCopyWith(
          _$_ScalePan value, $Res Function(_$_ScalePan) then) =
      __$$_ScalePanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double ratioScale,
      double tempRatioScale,
      bool isScalingAndPan,
      Offset focalPoint,
      Offset tempPanDistance,
      Offset panDistance});
}

/// @nodoc
class __$$_ScalePanCopyWithImpl<$Res>
    extends _$ScalePanCopyWithImpl<$Res, _$_ScalePan>
    implements _$$_ScalePanCopyWith<$Res> {
  __$$_ScalePanCopyWithImpl(
      _$_ScalePan _value, $Res Function(_$_ScalePan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratioScale = null,
    Object? tempRatioScale = null,
    Object? isScalingAndPan = null,
    Object? focalPoint = null,
    Object? tempPanDistance = null,
    Object? panDistance = null,
  }) {
    return _then(_$_ScalePan(
      ratioScale: null == ratioScale
          ? _value.ratioScale
          : ratioScale // ignore: cast_nullable_to_non_nullable
              as double,
      tempRatioScale: null == tempRatioScale
          ? _value.tempRatioScale
          : tempRatioScale // ignore: cast_nullable_to_non_nullable
              as double,
      isScalingAndPan: null == isScalingAndPan
          ? _value.isScalingAndPan
          : isScalingAndPan // ignore: cast_nullable_to_non_nullable
              as bool,
      focalPoint: null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      tempPanDistance: null == tempPanDistance
          ? _value.tempPanDistance
          : tempPanDistance // ignore: cast_nullable_to_non_nullable
              as Offset,
      panDistance: null == panDistance
          ? _value.panDistance
          : panDistance // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_ScalePan implements _ScalePan {
  const _$_ScalePan(
      {required this.ratioScale,
      required this.tempRatioScale,
      required this.isScalingAndPan,
      required this.focalPoint,
      required this.tempPanDistance,
      required this.panDistance});

  @override
  final double ratioScale;
  @override
  final double tempRatioScale;
  @override
  final bool isScalingAndPan;
  @override
  final Offset focalPoint;
  @override
  final Offset tempPanDistance;
  @override
  final Offset panDistance;

  @override
  String toString() {
    return 'ScalePan(ratioScale: $ratioScale, tempRatioScale: $tempRatioScale, isScalingAndPan: $isScalingAndPan, focalPoint: $focalPoint, tempPanDistance: $tempPanDistance, panDistance: $panDistance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScalePan &&
            (identical(other.ratioScale, ratioScale) ||
                other.ratioScale == ratioScale) &&
            (identical(other.tempRatioScale, tempRatioScale) ||
                other.tempRatioScale == tempRatioScale) &&
            (identical(other.isScalingAndPan, isScalingAndPan) ||
                other.isScalingAndPan == isScalingAndPan) &&
            (identical(other.focalPoint, focalPoint) ||
                other.focalPoint == focalPoint) &&
            (identical(other.tempPanDistance, tempPanDistance) ||
                other.tempPanDistance == tempPanDistance) &&
            (identical(other.panDistance, panDistance) ||
                other.panDistance == panDistance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ratioScale, tempRatioScale,
      isScalingAndPan, focalPoint, tempPanDistance, panDistance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScalePanCopyWith<_$_ScalePan> get copyWith =>
      __$$_ScalePanCopyWithImpl<_$_ScalePan>(this, _$identity);
}

abstract class _ScalePan implements ScalePan {
  const factory _ScalePan(
      {required final double ratioScale,
      required final double tempRatioScale,
      required final bool isScalingAndPan,
      required final Offset focalPoint,
      required final Offset tempPanDistance,
      required final Offset panDistance}) = _$_ScalePan;

  @override
  double get ratioScale;
  @override
  double get tempRatioScale;
  @override
  bool get isScalingAndPan;
  @override
  Offset get focalPoint;
  @override
  Offset get tempPanDistance;
  @override
  Offset get panDistance;
  @override
  @JsonKey(ignore: true)
  _$$_ScalePanCopyWith<_$_ScalePan> get copyWith =>
      throw _privateConstructorUsedError;
}
