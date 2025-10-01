import 'dart:io'show Platform, SocketException; // chỉ dùng được nếu không build web
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/network/api_client.dart';
import '../models/auth_result.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<AuthResult> login(String email, String password) async {
    try {
      final res = await ApiClient.post("/auth/login", {
        "email": email,
        "password": password,
      });
      return AuthResult(success: true, token: res["token"]);
    } catch (e) {
      if (e is SocketException) {
        return AuthResult(success: false, message: "Không có kết nối Internet");
      }
      return AuthResult(success: false, message: "Lỗi không xác định: $e");
    }
  }

  Future<AuthResult> register(
    String name,
    String email,
    String password,
    String phonenumber,
  ) async {
    try {
      final res = await ApiClient.post("/auth/register", {
        "name": name,
        "email": email,
        "password": password,
        "phone": phonenumber,
      });
      if (res["message"] == "Đăng ký thành công") {
        return AuthResult(success: true, message: res["message"]);
      }
      return AuthResult(success: false, message: res["message"]);
    } catch (e) {
      return AuthResult(success: false, message: e.toString());
    }
  }

  /// Google Login (Firebase client → BE → JWT của hệ thống)
  Future<AuthResult> signInWithGoogle() async {
    try {
      String? idToken;

      if (kIsWeb) {
        final cred = await _auth.signInWithPopup(GoogleAuthProvider());
        idToken = await cred.user?.getIdToken();
      } else {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          return AuthResult(
            success: false,
            message: "Người dùng hủy đăng nhập",
          );
        }
        final googleAuth = await googleUser.authentication;
        final cred = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCred = await _auth.signInWithCredential(cred);
        idToken = await userCred.user?.getIdToken();
      }

      if (idToken == null) {
        return AuthResult(
          success: false,
          message: "Không lấy được Google ID token",
        );
      }

      // Gửi idToken sang BE để xác thực & lưu DB
      final res = await ApiClient.post("/auth/google", {"idToken": idToken});

      return AuthResult(
        success: true,
        token: res["token"],
        message: res["message"],
      );
    } catch (e) {
      return AuthResult(success: false, message: "Google sign-in error: $e");
    }
  }

  // Validators
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Vui lòng nhập email";
    if (!value.contains("@")) return "Email không hợp lệ";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Vui lòng nhập mật khẩu";
    if (value.length < 6) return "Mật khẩu ít nhất 6 ký tự";
    return null;
  }
}
