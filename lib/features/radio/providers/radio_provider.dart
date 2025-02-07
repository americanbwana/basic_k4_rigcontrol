import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import '../models/radio_state.dart';
import '../models/radio_mode.dart';
import '../models/band_info.dart';
import '../services/radio_commands.dart';
import '../services/radio_service.dart';

final radioServiceProvider = Provider((ref) => RadioService());

final radioStateProvider = StateNotifierProvider<RadioStateNotifier, RadioState>((ref) {
  final service = ref.watch(radioServiceProvider);
  return RadioStateNotifier(service);
});

class RadioStateNotifier extends StateNotifier<RadioState> {
  final RadioService _service;
  final _logger = Logger('RadioStateNotifier');

  RadioStateNotifier(this._service) : super(const RadioState()) {
    _init();
  }

  Future<void> _init() async {
    try {
      await _service.connect();
      state = state.copyWith(isConnected: true);
      await _getInitialState();
      _service.responses.listen(_handleResponse);
      _startPolling();
    } catch (e) {
      _logger.severe('Failed to initialize: $e');
    }
  }

  Future<void> _getInitialState() async {
    final completer = Completer<void>();
    var responsesReceived = 0;
    const expectedResponses = 9; // FA, FB, MD, MD$, BN, BN$, PC, SH, SH$

    void handleInitialResponse(String response) {
      _handleResponse(response);
      responsesReceived++;
      if (responsesReceived >= expectedResponses) {
        completer.complete();
      }
    }

    final subscription = _service.responses.listen(handleInitialResponse);

    _service.sendCommand(RadioCommands.getFrequencyA());
    _service.sendCommand(RadioCommands.getFrequencyB());
    _service.sendCommand(RadioCommands.getModeA());
    _service.sendCommand(RadioCommands.getModeB());
    _service.sendCommand(RadioCommands.getBandA());
    _service.sendCommand(RadioCommands.getBandB());
    _service.sendCommand(RadioCommands.getPower());
    _service.sendCommand(RadioCommands.getFilterWidthA());
    _service.sendCommand(RadioCommands.getFilterWidthB());

    await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 2))
    ]);

    await subscription.cancel();
  }

  void _startPolling() {
    Future.doWhile(() async {
      _service.sendCommand(RadioCommands.getFrequencyA());
      _service.sendCommand(RadioCommands.getFrequencyB());
      _service.sendCommand(RadioCommands.getModeA());
      _service.sendCommand(RadioCommands.getModeB());
      _service.sendCommand(RadioCommands.getBandA());
      _service.sendCommand(RadioCommands.getBandB());
      _service.sendCommand(RadioCommands.getPower());
      _service.sendCommand(RadioCommands.getFilterWidthA());
      _service.sendCommand(RadioCommands.getFilterWidthB());
      await Future.delayed(const Duration(seconds: 1));
      return state.isConnected;
    });
  }

  void setPower(int power) {
    state = state.copyWith(power: power);
    _service.sendCommand(RadioCommands.setPower(power));
  }

  void setFilterWidthA(int width) {
    _logger.fine('Setting VFOA filter width to: $width');
    state = state.copyWith(
      vfoA: state.vfoA.copyWith(filterWidth: width),
    );
    _service.sendCommand(RadioCommands.setFilterWidthA(width));
  }

  void setFilterWidthB(int width) {
    _logger.fine('Setting VFOB filter width to: $width');
    state = state.copyWith(
      vfoB: state.vfoB.copyWith(filterWidth: width),
    );
    _service.sendCommand(RadioCommands.setFilterWidthB(width));
  }

  void setFrequencyA(int frequency) {
    state = state.copyWith(
      vfoA: state.vfoA.copyWith(frequency: frequency),
    );
    _service.sendCommand(RadioCommands.setFrequencyA(frequency));
  }

  void setFrequencyB(int frequency) {
    state = state.copyWith(
      vfoB: state.vfoB.copyWith(frequency: frequency),
    );
    _service.sendCommand(RadioCommands.setFrequencyB(frequency));
  }

  void setModeA(RadioMode mode) {
    _logger.fine('Setting VFOA mode to: ${mode.display}');
    state = state.copyWith(
      vfoA: state.vfoA.copyWith(mode: mode),
    );
    _service.sendCommand(RadioCommands.setModeA(mode.value));
  }

  void setModeB(RadioMode mode) {
    _logger.fine('Setting VFOB mode to: ${mode.display}');
    state = state.copyWith(
      vfoB: state.vfoB.copyWith(mode: mode),
    );
    _service.sendCommand(RadioCommands.setModeB(mode.value));
  }

  void setBandA(int band) {
    final defaultFreq = BandInfo.bands.firstWhere(
      (b) => b.value == band,
      orElse: () => BandInfo.bands[0],
    ).defaultFreq;
    
    state = state.copyWith(
      vfoA: state.vfoA.copyWith(
        band: band,
        frequency: defaultFreq,
      ),
    );
    _service.sendCommand(RadioCommands.setBandA(band));
    _service.sendCommand(RadioCommands.setFrequencyA(defaultFreq));
  }

  void setBandB(int band) {
    final defaultFreq = BandInfo.bands.firstWhere(
      (b) => b.value == band,
      orElse: () => BandInfo.bands[0],
    ).defaultFreq;
    
    state = state.copyWith(
      vfoB: state.vfoB.copyWith(
        band: band,
        frequency: defaultFreq,
      ),
    );
    _service.sendCommand(RadioCommands.setBandB(band));
    _service.sendCommand(RadioCommands.setFrequencyB(defaultFreq));
  }

  void _handleResponse(String response) {
    _logger.fine('Handling response: $response');
    
    if (response.contains(';')) {
      response.split(';')
        .where((cmd) => cmd.isNotEmpty)
        .forEach(_handleSingleResponse);
    } else {
      _handleSingleResponse(response);
    }
  }

  void _handleSingleResponse(String response) {
    response = response.trim();
    _logger.fine('Raw response: "$response"');
    
    if (!response.endsWith(';')) {
      response += ';';
    }

    if (response.startsWith('FA')) {
      final freq = RadioCommands.parseFrequency(response);
      _logger.fine('Parsed VFOA frequency: $freq');
      if (freq > 0) {
        state = state.copyWith(
          vfoA: state.vfoA.copyWith(frequency: freq),
        );
      }
    } else if (response.startsWith('FB')) {
      final freq = RadioCommands.parseFrequency(response);
      _logger.fine('Parsed VFOB frequency: $freq');
      if (freq > 0) {
        state = state.copyWith(
          vfoB: state.vfoB.copyWith(frequency: freq),
        );
      }
    } else if (response.startsWith('MD')) {
      final mode = RadioCommands.parseMode(response);
      _logger.fine('Mode response: $response -> ${mode.display}');
      if (response.contains('\$')) {
        state = state.copyWith(
          vfoB: state.vfoB.copyWith(mode: mode),
        );
        _logger.fine('Updated VFOB mode to: ${state.vfoB.mode.display}');
      } else {
        state = state.copyWith(
          vfoA: state.vfoA.copyWith(mode: mode),
        );
        _logger.fine('Updated VFOA mode to: ${state.vfoA.mode.display}');
      }
    } else if (response.startsWith('BN')) {
      final match = RegExp(r'BN[\$]?(\d+)').firstMatch(response);
      if (match != null) {
        final band = int.parse(match.group(1)!);
        _logger.fine('Band response: $response -> $band');
        if (response.contains('\$')) {
          state = state.copyWith(
            vfoB: state.vfoB.copyWith(band: band),
          );
        } else {
          state = state.copyWith(
            vfoA: state.vfoA.copyWith(band: band),
          );
        }
      }
    } else if (response.startsWith('PC')) {
      final power = RadioCommands.parsePower(response);
      _logger.fine('Power response: $response -> $power');
      state = state.copyWith(power: power);
    } else if (response.startsWith('SH')) {
      final width = RadioCommands.parseFilterWidth(response);
      _logger.fine('Filter width response: $response -> $width');
      if (response.contains('\$')) {
        state = state.copyWith(
          vfoB: state.vfoB.copyWith(filterWidth: width),
        );
        _logger.fine('Updated VFOB filter width to: ${state.vfoB.filterWidth}');
      } else {
        state = state.copyWith(
          vfoA: state.vfoA.copyWith(filterWidth: width),
        );
        _logger.fine('Updated VFOA filter width to: ${state.vfoA.filterWidth}');
      }
    }
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }
}