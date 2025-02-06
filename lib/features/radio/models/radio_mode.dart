enum RadioMode {
  lsb(1, 'LSB'),
  usb(2, 'USB'), 
  cw(3, 'CW'),
  fm(4, 'FM'),
  am(5, 'AM'),
  data(6, 'DATA'),
  cwr(7, 'CW-R');

  final int value;
  final String display;
  
  const RadioMode(this.value, this.display);

  static RadioMode fromValue(int value) {
    return RadioMode.values.firstWhere(
      (mode) => mode.value == value,
      orElse: () => RadioMode.usb,
    );
  }
}