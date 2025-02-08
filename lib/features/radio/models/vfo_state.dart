import 'package:freezed_annotation/freezed_annotation.dart';
import 'radio_mode.dart';

part 'vfo_state.freezed.dart';

@freezed
@freezed
class VfoState with _$VfoState {
  const factory VfoState({
    @Default(14074000) int frequency,
    @Default(RadioMode.usb) RadioMode mode,
    @Default(5) int band,
    @Default(2400) int filterWidth,
    @Default(0) int sMeter,  // Add S-meter value
  }) = _VfoState;
}