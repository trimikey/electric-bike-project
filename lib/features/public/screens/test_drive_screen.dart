import 'package:flutter/material.dart';
import '../widgets/placeholder_widget.dart';

class TestDriveScreen extends StatelessWidget {
  const TestDriveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Đặt lịch lái thử")),
      body: PlaceholderWidget(
        title: "Đặt lịch lái thử",
        description: "Form nhập thông tin khách hàng, chọn xe, chọn ngày giờ.",
      ),
    );
  }
}
