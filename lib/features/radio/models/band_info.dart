class BandInfo {
  final int value;
  final String name;
  final int defaultFreq;

  const BandInfo({
    required this.value,
    required this.name,
    required this.defaultFreq,
  });

  static final List<BandInfo> bands = [
    BandInfo(value: 0, name: '160', defaultFreq: 1840000),
    BandInfo(value: 1, name: '80', defaultFreq: 3573000),
    BandInfo(value: 2, name: '60', defaultFreq: 5357000),
    BandInfo(value: 3, name: '40', defaultFreq: 7074000),
    BandInfo(value: 4, name: '30', defaultFreq: 10136000),
    BandInfo(value: 5, name: '20', defaultFreq: 14074000),
    BandInfo(value: 6, name: '17', defaultFreq: 18100000),
    BandInfo(value: 7, name: '15', defaultFreq: 21074000),
    BandInfo(value: 8, name: '12', defaultFreq: 24915000),
    BandInfo(value: 9, name: '10', defaultFreq: 28074000),
    BandInfo(value: 10, name: '6', defaultFreq: 50313000),
  ];
}