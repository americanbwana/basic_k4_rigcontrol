import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/radio_provider.dart';
import '../widgets/vfo_display.dart';
import '../widgets/mode_selector.dart';
import '../widgets/band_grid.dart';
import '../widgets/frequency_input.dart';
import '../widgets/connection_status.dart';

class RadioControlScreen extends ConsumerWidget {
  const RadioControlScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioState = ref.watch(radioStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('K4 Control'),
        actions: [
          ConnectionStatus(isConnected: radioState.isConnected),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VfoDisplay(
                      vfoState: radioState.vfoA,
                      label: 'VFO A',
                    ),
                    const SizedBox(height: 8),
                    FrequencyInput(
                      currentFrequency: radioState.vfoA.frequency,
                      onFrequencyChanged: (freq) => ref.read(radioStateProvider.notifier).setFrequencyA(freq),
                      isVfoB: false,
                    ),
                    const SizedBox(height: 8),
                    ModeSelector(
                      currentMode: radioState.vfoA.mode,
                      onModeSelected: (mode) => ref.read(radioStateProvider.notifier).setModeA(mode),
                      isVfoB: false,
                    ),
                    const SizedBox(height: 16),
                    BandGrid(
                      currentBand: radioState.vfoA.band,
                      onBandSelected: (band) => ref.read(radioStateProvider.notifier).setBandA(band),
                      isVfoB: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VfoDisplay(
                      vfoState: radioState.vfoB,
                      label: 'VFO B',
                    ),
                    const SizedBox(height: 8),
                    FrequencyInput(
                      currentFrequency: radioState.vfoB.frequency,
                      onFrequencyChanged: (freq) => ref.read(radioStateProvider.notifier).setFrequencyB(freq),
                      isVfoB: true,
                    ),
                    const SizedBox(height: 8),
                    ModeSelector(
                      currentMode: radioState.vfoB.mode,
                      onModeSelected: (mode) => ref.read(radioStateProvider.notifier).setModeB(mode),
                      isVfoB: true,
                    ),
                    const SizedBox(height: 16),
                    BandGrid(
                      currentBand: radioState.vfoB.band,
                      onBandSelected: (band) => ref.read(radioStateProvider.notifier).setBandB(band),
                      isVfoB: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}