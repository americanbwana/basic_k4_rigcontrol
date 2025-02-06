import 'package:flutter/material.dart';
import '../models/band_info.dart';

class BandGrid extends StatelessWidget {
  final int currentBand;
  final Function(int) onBandSelected;
  final bool isVfoB;

  const BandGrid({
    super.key,
    required this.currentBand,
    required this.onBandSelected,
    required this.isVfoB,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.0,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: BandInfo.bands.length,
      itemBuilder: (context, index) {
        final band = BandInfo.bands[index];
        final isSelected = band.value == currentBand;
        
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Theme.of(context).colorScheme.primary : null,
            foregroundColor: isSelected ? Theme.of(context).colorScheme.onPrimary : null,
          ),
          onPressed: () => onBandSelected(band.value),
          child: Text(
            band.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }
}