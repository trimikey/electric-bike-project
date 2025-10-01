import 'package:flutter/material.dart';
import '../widgets/placeholder_widget.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("So sánh xe / Tính trả góp")),
      body: PlaceholderWidget(
        title: "So sánh xe",
        description: "Chọn 2-3 xe để so sánh thông số. Công cụ tính trả góp.",
      ),
    );
  }
}
