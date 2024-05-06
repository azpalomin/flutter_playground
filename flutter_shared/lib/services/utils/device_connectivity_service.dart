import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter_shared/exceptions/util_exceptions.dart';
import 'package:flutter_shared/services/utils/exception_catcher.dart';

class DeviceConnectivityService {
  StreamController<bool>? onlineStreamController = StreamController<bool>.broadcast();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  // Singleton Setup
  DeviceConnectivityService._sharedInstance() {
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((connection) {
      onlineStreamController?.add(isConnected(connection));
    });
  }
  static final DeviceConnectivityService _shared = DeviceConnectivityService._sharedInstance();
  factory DeviceConnectivityService() => _shared;

  void dispose() {
    if (onlineStreamController != null) {
      onlineStreamController!.close();
      onlineStreamController == null;
    }
    if (connectivitySubscription != null) {
      connectivitySubscription!.cancel();
      connectivitySubscription = null;
    }
  }

  Stream<bool> getOnlineStream() {
    onlineStreamController ??= StreamController<bool>.broadcast();
    return onlineStreamController!.stream;
  }

  bool isConnected(ConnectivityResult connection) {
    return connection == ConnectivityResult.mobile || connection == ConnectivityResult.wifi;
  }

  Future<void> isOfflineThrow() async {
    bool online = await isOnline();
    if (!online) {
      await Future.delayed(const Duration(seconds: 2));
      online = await isOnline();
      if (!online) {
        throw LostConnectionException();
      }
    }
  }

  Future<bool> isOnline() async {
    ConnectivityResult connection = await Connectivity().checkConnectivity();
    return isConnected(connection);
  }

  static Future<String> getIpv4() async {
    String? ipv4;
    try {
      ipv4 = await Ipify.ipv4();
    } catch (e) {
      ExceptionCatcher.trackException(
        error: e as Exception,
        stackTrace: StackTrace.current,
      );
    }
    return ipv4 ?? '';
  }
}
