import 'package:flutter/foundation.dart';

abstract class IConnectionManager {
  Future<void> checkConnection({
    required VoidCallback onConnected,
    required VoidCallback otherwise,
  });

  Future<bool> get hasNetworkConnection;
}