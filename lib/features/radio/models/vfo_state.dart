import 'package:freezed_annotation/freezed_annotation.dart';
import 'radio_mode.dart';

part 'vfo_state.freezed.dart';

@freezed
class VfoState with _$VfoState {
  const factory VfoState({
    @Default(14074000) int frequency,
    @Default(RadioMode.usb) RadioMode mode,
    @Default(5) int band,
    @Default(2400) int filterWidth,  // Add filter width in Hz
  }) = _VfoState;
}