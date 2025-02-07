import 'package:flutter/material.dart';
import '../models/band_info.dart';

class BandSelector extends StatelessWidget {
  final int currentBand;
  final Function(int) onBandSelected;
  final bool isVfoB;

  const BandSelector({
    super.key,
    required this.currentBand,
    required this.onBandSelected,
    required this.isVfoB,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: currentBand,
      onChanged: (int? value) {
        if (value != null) {
          onBandSelected(value);
        }
      },
      items: BandInfo.bands
          .where((band) => band.value <= 10) // Exclude transverter bands
          .map<DropdownMenuItem<int>>((band) {
        return DropdownMenuItem<int>(
          value: band.value,
          child: Text(band.display),
        );
      }).toList(),
    );
  }
}