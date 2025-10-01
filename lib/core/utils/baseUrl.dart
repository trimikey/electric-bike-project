// lib/utils/baseUrl.dart
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class BaseUrl {
  static String get value {
    if (kIsWeb) {
      return "http://localhost:5000"; // Flutter Web
    }

    if (Platform.isAndroid) {
      return "http://10.0.2.2:5000"; // Android Emulator
    }

    if (Platform.isIOS) {
      return "http://localhost:5000"; // iOS Simulator
    }

    // Trường hợp chạy trên thiết bị thật
    return "http://192.168.x.x:5000"; // <-- Thay bằng IP LAN thật của máy bạn
  }
}
