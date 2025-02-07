import 'package:flutter/material.dart';

class PowerControl extends StatelessWidget {
  final int currentPower;
  final Function(int) onPowerChanged;

  const PowerControl({
    super.key,
    required this.currentPower,
    required this.onPowerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Power: '),
        Expanded(
          child: Slider(
            value: currentPower.toDouble(),
            min: 0,
            max: 100,
            divisions: 100,
            label: '$currentPower W',
            onChanged: (value) => onPowerChanged(value.round()),
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            '${currentPower}W',
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}