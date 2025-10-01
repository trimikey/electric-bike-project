import 'package:flutter/material.dart';
import '../widgets/placeholder_widget.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Danh mục xe")),
      body: PlaceholderWidget(
        title: "Danh mục xe",
        description: "Danh sách model xe, cấu hình, màu sắc, giá bán.",
      ),
    );
  }
}
