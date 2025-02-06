import 'package:flutter_test/flutter_test.dart';
import 'package:basic_rigcontrol/features/radio/services/radio_commands.dart';
import 'package:basic_rigcontrol/features/radio/models/radio_mode.dart';

void main() {
  group('RadioCommands', () {
    test('parseFrequency correctly parses FA response', () {
      expect(RadioCommands.parseFrequency('FA14074000;'), 14074000);
    });

    test('formatFrequency correctly formats frequency', () {
      expect(RadioCommands.formatFrequency(14074000), '14.074.000');
    });

    test('parseMode correctly parses mode response', () {
      expect(RadioCommands.parseMode('MD1;'), RadioMode.lsb);
    });
  });
}