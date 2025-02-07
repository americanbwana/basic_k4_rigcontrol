import 'package:flutter/material.dart';

class FilterControl extends StatelessWidget {
  final int currentWidth;
  final Function(int) onWidthChanged;
  final bool isVfoB;

  const FilterControl({
    super.key,
    required this.currentWidth,
    required this.onWidthChanged,
    required this.isVfoB,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Filter: '),
        Expanded(
          child: Slider(
            value: currentWidth.toDouble(),
            min: 50,
            max: 4000,
            divisions: 79,
            label: '${currentWidth}Hz',
            onChanged: (value) => onWidthChanged(value.round()),
          ),
        ),
        SizedBox(
          width: 60,
          child: Text(
            '${currentWidth}Hz',
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}