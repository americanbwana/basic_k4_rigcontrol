import '../models/radio_mode.dart';

class RadioCommands {
// add commands to get power state
    static String getPower() => 'PC;';
  static String setPower(int power) => 'PC${power.toString().padLeft(3, '0')};';
  
  static int parsePower(String response) {
    final match = RegExp(r'PC(\d+);').firstMatch(response);
    if (match != null) {
      return int.parse(match.group(1)!);
    }
    return 10; // Default power
  }

// add S-meter commands
  static String getSMeterA() => 'SM;';
  static String getSMeterB() => 'SM\$;';

  // add filter width commands
   // Change SH to BW
  static String getFilterWidthA() => 'BW;';
  static String getFilterWidthB() => 'BW\$;';
  static String setFilterWidthA(int width) => 'BW${(width/10).round().toString().padLeft(4, '0')};';
  static String setFilterWidthB(int width) => 'BW\$${(width/10).round().toString().padLeft(4, '0')};';
  
  // Commands to get current state
  static String getFrequencyA() => 'FA;';
  static String getFrequencyB() => 'FB;';
  static String getModeA() => 'MD;';
  static String getModeB() => 'MD\$;';
  static String getBandA() => 'BN;';
  static String getBandB() => 'BN\$;';

  // Commands to set state
  static String setFrequencyA(int frequency) => 'FA${frequency.toString().padLeft(11, '0')};';
  static String setFrequencyB(int frequency) => 'FB${frequency.toString().padLeft(11, '0')};';
  static String setModeA(int mode) => 'MD$mode;';
  static String setModeB(int mode) => 'MD\$$mode;';
  static String setBandA(int band) => 'BN${band.toString().padLeft(2, '0')};';
  static String setBandB(int band) => 'BN\$${band.toString().padLeft(2, '0')};';

  // add parse meter
    static int parseSMeter(String response) {
    if (!response.endsWith(';')) {
      response += ';';
    }
    final match = RegExp(r'SM[\$]?(\d+);').firstMatch(response);
    if (match != null) {
      return int.parse(match.group(1)!);
    }
    return 0;
  }
  
  // Response parsing
  static int parseFrequency(String response) {
    if (!response.endsWith(';')) {
      response += ';';
    }
    final match = RegExp(r'F[AB](\d+);').firstMatch(response);
    if (match != null) {
      final freqStr = match.group(1)!;
      return int.parse(freqStr);
    }
    return 0;
  }

// add filter width parsing
  static int parseFilterWidth(String response) {
    if (!response.endsWith(';')) {
      response += ';';
    }
    final match = RegExp(r'BW[\$]?(\d+);').firstMatch(response);
    if (match != null) {
      return int.parse(match.group(1)!) * 10; // Multiply by 10 since radio returns value/10
    }
    return 2400;
  }

  static String formatFrequency(int frequency) {
    final mhz = (frequency ~/ 1000000).toString().padLeft(2, '0');
    final khz = ((frequency % 1000000) ~/ 1000).toString().padLeft(3, '0');
    final hz = (frequency % 1000).toString().padLeft(3, '0');
    return '$mhz.$khz.$hz';
  }

  static RadioMode parseMode(String response) {
    if (!response.endsWith(';')) {
      response += ';';
    }
    final match = RegExp(r'MD[\$]?(\d+);').firstMatch(response);
    if (match != null) {
      final modeValue = int.parse(match.group(1)!);
      return RadioMode.values.firstWhere(
        (mode) => mode.value == modeValue,
        orElse: () => RadioMode.usb,
      );
    }
    return RadioMode.usb;
  }

  static int parseBand(String response) {
    if (!response.endsWith(';')) {
      response += ';';
    }
    final match = RegExp(r'BN[\$]?(\d+);').firstMatch(response);
    if (match != null) {
      return int.parse(match.group(1)!);
    }
    return 5;
  }

  static bool isValidResponse(String response) {
    return response.isNotEmpty && 
           (response.endsWith(';') || response.contains(';')) &&
           (response.startsWith('FA') ||
            response.startsWith('FB') ||
            response.startsWith('MD') ||
            response.startsWith('BN'));
  }
}