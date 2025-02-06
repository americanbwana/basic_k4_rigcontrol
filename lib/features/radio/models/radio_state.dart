import 'package:freezed_annotation/freezed_annotation.dart';
import 'vfo_state.dart';

part 'radio_state.freezed.dart';

@freezed
class RadioState with _$RadioState {
  const factory RadioState({
    @Default(VfoState()) VfoState vfoA,
    @Default(VfoState()) VfoState vfoB,
    @Default(false) bool isConnected,
  }) = _RadioState;
}