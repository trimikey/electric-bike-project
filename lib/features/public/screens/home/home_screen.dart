import 'package:flutter/material.dart';
import 'package:test_windows_app/core/theme/theme_color.dart';
import 'package:test_windows_app/features/public/screens/home/sections/new_products.dart';
import 'sections/hero_banner.dart';
import 'sections/model_selector.dart';
import '../../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800; // breakpoint responsive

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HomeAppBar(),
      ),
      // ✅ Chỉ có Drawer nếu là mobile
      endDrawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text("Menu", style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(title: Text("Mua ngay")),
                  ListTile(title: Text("Lái thử miễn phí")),
                  ListTile(title: Text("Sản phẩm")),
                  ListTile(title: Text("Giới thiệu")),
                  ListTile(title: Text("Liên hệ")),
                ],
              ),
            )
          : null,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroBanner(),
            SizedBox(height: 24),
            ModelSelector(),
            SizedBox(height: 40),
             NewProducts(),
            SizedBox(height: 40),
          
          ],
        ),
      ),
    );
  }
}
