import 'package:flutter/material.dart';
import '../models/vfo_state.dart';
import '../services/radio_commands.dart';

class VfoDisplay extends StatelessWidget {
  final VfoState vfoState;
  final String label;

  const VfoDisplay({
    super.key,
    required this.vfoState,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}