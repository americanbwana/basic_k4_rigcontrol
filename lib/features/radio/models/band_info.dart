class BandInfo {
  final int value;
  final String display;
  final int defaultFreq;

  const BandInfo({
    required this.value,
    required this.display,
    required this.defaultFreq,
  });

  static final List<BandInfo> bands = [
    const BandInfo(value: 0, display: '160m', defaultFreq: 1840000),
    const BandInfo(value: 1, display: '80m', defaultFreq: 3573000),
    const BandInfo(value: 2, display: '60m', defaultFreq: 5357000),
    const BandInfo(value: 3, display: '40m', defaultFreq: 7074000),
    const BandInfo(value: 4, display: '30m', defaultFreq: 10136000),
    const BandInfo(value: 5, display: '20m', defaultFreq: 14074000),
    const BandInfo(value: 6, display: '17m', defaultFreq: 18100000),
    const BandInfo(value: 7, display: '15m', defaultFreq: 21074000),
    const BandInfo(value: 8, display: '12m', defaultFreq: 24915000),
    const BandInfo(value: 9, display: '10m', defaultFreq: 28074000),
    const BandInfo(value: 10, display: '6m', defaultFreq: 50313000),
  ];
}