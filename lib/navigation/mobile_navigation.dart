import 'package:flutter/material.dart';
import 'package:test_windows_app/features/public/screens/booking_screen.dart';
import 'package:test_windows_app/features/public/screens/compare_screen.dart';
import 'package:test_windows_app/features/public/screens/home/home_screen.dart';
import 'package:test_windows_app/features/public/screens/product_list_screen.dart';
import 'package:test_windows_app/features/public/screens/test_drive_screen.dart';
import 'package:test_windows_app/features/public/screens/tracking_screen.dart';

class MobileNavigation extends StatefulWidget {
  const MobileNavigation({super.key});

  @override
  State<MobileNavigation> createState() => _MobileNavigationState();
}

class _MobileNavigationState extends State<MobileNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const ProductListScreen(),
    const CompareScreen(),
    const TestDriveScreen(),
    const BookingScreen(),
    const TrackingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Danh mục'),
          BottomNavigationBarItem(icon: Icon(Icons.compare), label: 'So sánh'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Lái thử'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Đặt cọc'),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Đơn hàng'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
