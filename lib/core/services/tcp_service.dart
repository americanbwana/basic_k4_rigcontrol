import 'dart:async';
import 'dart:io';
import 'package:logging/logging.dart';

class RadioService {
  static const String host = '192.168.1.16';
  static const int port = 9201;
  final _logger = Logger('RadioService');
  
  Socket? _socket;
  final StreamController<String> _responseController = StreamController<String>.broadcast();
  bool _isConnected = false;

  bool get isConnected => _isConnected;
  Stream<String> get responses => _responseController.stream;

  Future<void> connect() async {
    try {
      _socket = await Socket.connect(host, port);
      _isConnected = true;
      _logger.info('Connected to radio');
      
      _socket!.listen(
        (data) {
          final response = String.fromCharCodes(data).trim();
          _logger.fine('Received: $response');
          _responseController.add(response);
        },
        onError: (error) {
          _logger.severe('Socket error: $error');
          _isConnected = false;
          reconnect();
        },
        onDone: () {
          _logger.warning('Socket closed');
          _isConnected = false;
          reconnect();
        },
      );
    } catch (e) {
      _logger.severe('Connection failed: $e');
      _isConnected = false;
      await Future.delayed(Duration(seconds: 5));
      reconnect();
    }
  }

  Future<void> reconnect() async {
    _socket?.destroy();
    await connect();
  }

  void sendCommand(String command) {
    if (_isConnected && _socket != null) {
      _logger.fine('Sending: $command');
      _socket!.write('$command;');
    }
  }

  void dispose() {
    _socket?.destroy();
    _responseController.close();
  }
}