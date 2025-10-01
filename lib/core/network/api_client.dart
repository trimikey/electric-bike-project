import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/baseUrl.dart';
class ApiClient {
  static Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> body) async {
    final url = Uri.parse("${BaseUrl.value}$path");
    
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data["message"] ?? data["error"] ?? "Lỗi không xác định");
      }
    } catch (e) {
      throw Exception("API Error: ${e.toString()}");
    }
  }
}
