import 'package:freezed_annotation/freezed_annotation.dart';
import 'vfo_state.dart';

part 'radio_state.freezed.dart';

@freezed
class RadioState with _$RadioState {
  const factory RadioState({
    @Default(false) bool isConnected,
    @Default(VfoState()) VfoState vfoA,
    @Default(VfoState()) VfoState vfoB,
    @Default(10) int power,  // Add power setting
  }) = _RadioState;
}