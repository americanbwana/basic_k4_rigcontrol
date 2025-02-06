import 'package:flutter/material.dart';
import '../models/radio_mode.dart';

class ModeSelector extends StatelessWidget {
  final RadioMode currentMode;
  final Function(RadioMode) onModeSelected;
  final bool isVfoB;

  const ModeSelector({
    super.key,
    required this.currentMode,
    required this.onModeSelected,
    required this.isVfoB,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<RadioMode>(
      initialValue: currentMode,
      onSelected: onModeSelected,
      child: Chip(
        label: Text(currentMode.display),
        deleteIcon: const Icon(Icons.arrow_drop_down),
        onDeleted: null,
      ),
      itemBuilder: (BuildContext context) {
        return RadioMode.values.map((RadioMode mode) {
          return PopupMenuItem<RadioMode>(
            value: mode,
            child: Text(mode.display),
          );
        }).toList();
      },
    );
  }
}