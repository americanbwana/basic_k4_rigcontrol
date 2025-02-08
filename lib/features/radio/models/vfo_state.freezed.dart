// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vfo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VfoState {
  int get frequency => throw _privateConstructorUsedError;
  RadioMode get mode => throw _privateConstructorUsedError;
  int get band => throw _privateConstructorUsedError;
  int get filterWidth => throw _privateConstructorUsedError;
  int get sMeter => throw _privateConstructorUsedError;

  /// Create a copy of VfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VfoStateCopyWith<VfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VfoStateCopyWith<$Res> {
  factory $VfoStateCopyWith(VfoState value, $Res Function(VfoState) then) =
      _$VfoStateCopyWithImpl<$Res, VfoState>;
  @useResult
  $Res call(
      {int frequency, RadioMode mode, int band, int filterWidth, int sMeter});
}

/// @nodoc
class _$VfoStateCopyWithImpl<$Res, $Val extends VfoState>
    implements $VfoStateCopyWith<$Res> {
  _$VfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? mode = null,
    Object? band = null,
    Object? filterWidth = null,
    Object? sMeter = null,
  }) {
    return _then(_value.copyWith(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as RadioMode,
      band: null == band
          ? _value.band
          : band // ignore: cast_nullable_to_non_nullable
              as int,
      filterWidth: null == filterWidth
          ? _value.filterWidth
          : filterWidth // ignore: cast_nullable_to_non_nullable
              as int,
      sMeter: null == sMeter
          ? _value.sMeter
          : sMeter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VfoStateImplCopyWith<$Res>
    implements $VfoStateCopyWith<$Res> {
  factory _$$VfoStateImplCopyWith(
          _$VfoStateImpl value, $Res Function(_$VfoStateImpl) then) =
      __$$VfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int frequency, RadioMode mode, int band, int filterWidth, int sMeter});
}

/// @nodoc
class __$$VfoStateImplCopyWithImpl<$Res>
    extends _$VfoStateCopyWithImpl<$Res, _$VfoStateImpl>
    implements _$$VfoStateImplCopyWith<$Res> {
  __$$VfoStateImplCopyWithImpl(
      _$VfoStateImpl _value, $Res Function(_$VfoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? mode = null,
    Object? band = null,
    Object? filterWidth = null,
    Object? sMeter = null,
  }) {
    return _then(_$VfoStateImpl(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as RadioMode,
      band: null == band
          ? _value.band
          : band // ignore: cast_nullable_to_non_nullable
              as int,
      filterWidth: null == filterWidth
          ? _value.filterWidth
          : filterWidth // ignore: cast_nullable_to_non_nullable
              as int,
      sMeter: null == sMeter
          ? _value.sMeter
          : sMeter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VfoStateImpl implements _VfoState {
  const _$VfoStateImpl(
      {this.frequency = 14074000,
      this.mode = RadioMode.usb,
      this.band = 5,
      this.filterWidth = 2400,
      this.sMeter = 0});

  @override
  @JsonKey()
  final int frequency;
  @override
  @JsonKey()
  final RadioMode mode;
  @override
  @JsonKey()
  final int band;
  @override
  @JsonKey()
  final int filterWidth;
  @override
  @JsonKey()
  final int sMeter;

  @override
  String toString() {
    return 'VfoState(frequency: $frequency, mode: $mode, band: $band, filterWidth: $filterWidth, sMeter: $sMeter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VfoStateImpl &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.band, band) || other.band == band) &&
            (identical(other.filterWidth, filterWidth) ||
                other.filterWidth == filterWidth) &&
            (identical(other.sMeter, sMeter) || other.sMeter == sMeter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, frequency, mode, band, filterWidth, sMeter);

  /// Create a copy of VfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VfoStateImplCopyWith<_$VfoStateImpl> get copyWith =>
      __$$VfoStateImplCopyWithImpl<_$VfoStateImpl>(this, _$identity);
}

abstract class _VfoState implements VfoState {
  const factory _VfoState(
      {final int frequency,
      final RadioMode mode,
      final int band,
      final int filterWidth,
      final int sMeter}) = _$VfoStateImpl;

  @override
  int get frequency;
  @override
  RadioMode get mode;
  @override
  int get band;
  @override
  int get filterWidth;
  @override
  int get sMeter;

  /// Create a copy of VfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VfoStateImplCopyWith<_$VfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
