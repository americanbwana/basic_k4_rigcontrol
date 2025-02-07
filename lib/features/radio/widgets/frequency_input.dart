import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FrequencyInput extends StatefulWidget {
  final int currentFrequency;
  final Function(int) onFrequencyChanged;
  final bool isVfoB;

  const FrequencyInput({
    super.key, 
    required this.currentFrequency,
    required this.onFrequencyChanged,
    required this.isVfoB,
  });

  @override
  State<FrequencyInput> createState() => _FrequencyInputState();
}

class _FrequencyInputState extends State<FrequencyInput> {
  final TextEditingController _mhzController = TextEditingController();
  final TextEditingController _khzController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with current frequency
    final mhz = widget.currentFrequency ~/ 1000000;
    final khz = (widget.currentFrequency % 1000000) ~/ 1000;
    _mhzController.text = mhz.toString();
    _khzController.text = khz.toString().padLeft(3, '0');
  }

  @override
  void dispose() {
    _mhzController.dispose();
    _khzController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 60,
          child: TextField(
            controller: _mhzController,
            decoration: const InputDecoration(
              labelText: 'MHz',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        const Text('.'),
        SizedBox(
          width: 80,
          child: TextField(
            controller: _khzController,
            decoration: const InputDecoration(
              labelText: 'kHz',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            if (_mhzController.text.isNotEmpty && _khzController.text.isNotEmpty) {
              final mhz = int.parse(_mhzController.text);
              final khz = int.parse(_khzController.text);
              final freq = (mhz * 1000000) + (khz * 1000);
              widget.onFrequencyChanged(freq);
            }
          },
        ),
      ],
    );
  }
}