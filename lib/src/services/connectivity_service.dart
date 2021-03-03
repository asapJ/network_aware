import 'dart:async';

import 'package:connectivity/connectivity.dart';

class NetworkConnectivityService {
  StreamController<bool> _connectivityStreamController =
      StreamController<bool>();
  NetworkConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityStreamController.add(result == ConnectivityResult.none);
    });
  }

  Stream<bool> get stream => _connectivityStreamController.stream;

  void dispose() => _connectivityStreamController.close();
}
