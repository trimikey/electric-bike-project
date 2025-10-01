import 'package:flutter/material.dart';
import 'package:test_windows_app/features/public/screens/booking_screen.dart';
import 'package:test_windows_app/features/public/screens/compare_screen.dart';
import 'package:test_windows_app/features/public/screens/home/home_screen.dart';
import 'package:test_windows_app/features/public/screens/product_list_screen.dart';
import 'package:test_windows_app/features/public/screens/test_drive_screen.dart';
import 'package:test_windows_app/features/public/screens/tracking_screen.dart';

class WebNavigation extends StatefulWidget {
  const WebNavigation({super.key});

  @override
  State<WebNavigation> createState() => _WebNavigationState();
}

class _WebNavigationState extends State<WebNavigation> {
  String _selectedRoute = '/';

  void _navigate(String route) {
    setState(() {
      _selectedRoute = route;
    });
  }

  Widget _getScreen(String route) {
    switch (route) {
      case '/products':
        return const ProductListScreen();
      case '/compare':
        return const CompareScreen();
      case '/test-drive':
        return const TestDriveScreen();
      case '/booking':
        return const BookingScreen();
      case '/tracking':
        return const TrackingScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EV Website"),
        actions: [
          TextButton(onPressed: () => _navigate('/'), child: const Text("Trang chủ", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () => _navigate('/products'), child: const Text("Danh mục xe", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () => _navigate('/compare'), child: const Text("So sánh", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () => _navigate('/test-drive'), child: const Text("Lái thử", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () => _navigate('/booking'), child: const Text("Đặt cọc", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () => _navigate('/tracking'), child: const Text("Đơn hàng", style: TextStyle(color: Colors.white))),
        ],
      ),
      body: _getScreen(_selectedRoute),
    );
  }
}
