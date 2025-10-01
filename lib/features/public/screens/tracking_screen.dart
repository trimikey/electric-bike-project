import 'package:flutter/material.dart';
import '../widgets/placeholder_widget.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Theo dõi đơn hàng")),
      body: PlaceholderWidget(
        title: "Theo dõi đơn hàng",
        description: "Hiển thị trạng thái đơn hàng: đang xử lý, vận chuyển, giao.",
      ),
    );
  }
}
