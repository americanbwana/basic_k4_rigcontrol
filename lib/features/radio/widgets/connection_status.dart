import 'package:flutter/material.dart';

class ConnectionStatus extends StatelessWidget {
  final bool isConnected;

  const ConnectionStatus({
    super.key,
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isConnected ? Colors.green[100] : Colors.red[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isConnected ? Icons.link : Icons.link_off,
            color: isConnected ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            isConnected ? 'Connected' : 'Disconnected',
            style: TextStyle(
              color: isConnected ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}