import 'package:flutter/material.dart';
import '../widgets/placeholder_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Đặt cọc / Mua xe online")),
      body: PlaceholderWidget(
        title: "Đặt cọc / Mua xe",
        description: "Chọn xe, gói pin, màu sắc. Thanh toán đặt cọc.",
      ),
    );
  }
}
