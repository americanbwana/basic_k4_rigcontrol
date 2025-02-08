import 'package:flutter/material.dart';

class SMeter extends StatelessWidget {
  final int value;
  final bool isVfoB;

  const SMeter({
    super.key,
    required this.value,
    required this.isVfoB,
  });

  String _getSReading() {
    if (value <= 9) {
      return 'S${value}';
    } else {
      final db = (value - 9) * 10;
      return 'S9+${db}dB';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_getSReading()),
        const SizedBox(height: 4),
        Container(
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              for (int i = 0; i <= 19; i++)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    color: i <= value 
                      ? i <= 9 
                        ? Theme.of(context).colorScheme.primary 
                        : Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.surfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}