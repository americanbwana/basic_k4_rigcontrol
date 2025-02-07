import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../models/vfo_state.dart';
import '../services/radio_commands.dart';

class VfoDisplay extends StatelessWidget {
  final VfoState vfoState;
  final String label;
  final Function(int) onFrequencyChanged;

  const VfoDisplay({
    super.key,
    required this.vfoState,
    required this.label,
    required this.onFrequencyChanged,
  });

  void _handleScroll(PointerScrollEvent event) {
    final delta = event.scrollDelta.dy;
    final stepSize = 1000; // 1 kHz steps
    final newFreq = delta > 0 
        ? vfoState.frequency - stepSize 
        : vfoState.frequency + stepSize;
    onFrequencyChanged(newFreq);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Listener(
        onPointerSignal: (signal) {
          if (signal is PointerScrollEvent) {
            _handleScroll(signal);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                RadioCommands.formatFrequency(vfoState.frequency),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                vfoState.mode.display,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}