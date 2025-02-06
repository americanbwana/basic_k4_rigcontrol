// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RadioState {
  VfoState get vfoA => throw _privateConstructorUsedError;
  VfoState get vfoB => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RadioStateCopyWith<RadioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadioStateCopyWith<$Res> {
  factory $RadioStateCopyWith(
          RadioState value, $Res Function(RadioState) then) =
      _$RadioStateCopyWithImpl<$Res, RadioState>;
  @useResult
  $Res call({VfoState vfoA, VfoState vfoB, bool isConnected});

  $VfoStateCopyWith<$Res> get vfoA;
  $VfoStateCopyWith<$Res> get vfoB;
}

/// @nodoc
class _$RadioStateCopyWithImpl<$Res, $Val extends RadioState>
    implements $RadioStateCopyWith<$Res> {
  _$RadioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vfoA = null,
    Object? vfoB = null,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      vfoA: null == vfoA
          ? _value.vfoA
          : vfoA // ignore: cast_nullable_to_non_nullable
              as VfoState,
      vfoB: null == vfoB
          ? _value.vfoB
          : vfoB // ignore: cast_nullable_to_non_nullable
              as VfoState,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VfoStateCopyWith<$Res> get vfoA {
    return $VfoStateCopyWith<$Res>(_value.vfoA, (value) {
      return _then(_value.copyWith(vfoA: value) as $Val);
    });
  }

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VfoStateCopyWith<$Res> get vfoB {
    return $VfoStateCopyWith<$Res>(_value.vfoB, (value) {
      return _then(_value.copyWith(vfoB: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RadioStateImplCopyWith<$Res>
    implements $RadioStateCopyWith<$Res> {
  factory _$$RadioStateImplCopyWith(
          _$RadioStateImpl value, $Res Function(_$RadioStateImpl) then) =
      __$$RadioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VfoState vfoA, VfoState vfoB, bool isConnected});

  @override
  $VfoStateCopyWith<$Res> get vfoA;
  @override
  $VfoStateCopyWith<$Res> get vfoB;
}

/// @nodoc
class __$$RadioStateImplCopyWithImpl<$Res>
    extends _$RadioStateCopyWithImpl<$Res, _$RadioStateImpl>
    implements _$$RadioStateImplCopyWith<$Res> {
  __$$RadioStateImplCopyWithImpl(
      _$RadioStateImpl _value, $Res Function(_$RadioStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vfoA = null,
    Object? vfoB = null,
    Object? isConnected = null,
  }) {
    return _then(_$RadioStateImpl(
      vfoA: null == vfoA
          ? _value.vfoA
          : vfoA // ignore: cast_nullable_to_non_nullable
              as VfoState,
      vfoB: null == vfoB
          ? _value.vfoB
          : vfoB // ignore: cast_nullable_to_non_nullable
              as VfoState,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RadioStateImpl implements _RadioState {
  const _$RadioStateImpl(
      {this.vfoA = const VfoState(),
      this.vfoB = const VfoState(),
      this.isConnected = false});

  @override
  @JsonKey()
  final VfoState vfoA;
  @override
  @JsonKey()
  final VfoState vfoB;
  @override
  @JsonKey()
  final bool isConnected;

  @override
  String toString() {
    return 'RadioState(vfoA: $vfoA, vfoB: $vfoB, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioStateImpl &&
            (identical(other.vfoA, vfoA) || other.vfoA == vfoA) &&
            (identical(other.vfoB, vfoB) || other.vfoB == vfoB) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vfoA, vfoB, isConnected);

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioStateImplCopyWith<_$RadioStateImpl> get copyWith =>
      __$$RadioStateImplCopyWithImpl<_$RadioStateImpl>(this, _$identity);
}

abstract class _RadioState implements RadioState {
  const factory _RadioState(
      {final VfoState vfoA,
      final VfoState vfoB,
      final bool isConnected}) = _$RadioStateImpl;

  @override
  VfoState get vfoA;
  @override
  VfoState get vfoB;
  @override
  bool get isConnected;

  /// Create a copy of RadioState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RadioStateImplCopyWith<_$RadioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
