import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static const _tokenKey = "access_token";

  /// Lưu token
 static Future<void> saveToken(String token) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  } catch (e) {
    throw Exception("Lỗi khi lưu token: $e");
  }
}

  /// Lấy token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Xóa token (logout)
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
