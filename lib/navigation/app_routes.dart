import 'package:flutter/material.dart';
import 'package:test_windows_app/features/public/screens/home/home_screen.dart';
import '../features/public/screens/product_list_screen.dart';
import '../features/public/screens/compare_screen.dart';
import '../features/public/screens/test_drive_screen.dart';
import '../features/public/screens/booking_screen.dart';
import '../features/public/screens/tracking_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/auth/screens/forget_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => const LoginScreen(),
    "/register": (context) => const RegisterScreen(),
    "/forgot-password": (context) => const ForgotPasswordScreen(),
    "/home": (context) => const HomeScreen(),
    "/products": (context) => const ProductListScreen(),
    "/compare": (context) => const CompareScreen(),
    "/test-drive": (context) => const TestDriveScreen(),
    "/booking": (context) => const BookingScreen(),
    "/tracking": (context) => const TrackingScreen(),
  };
}
