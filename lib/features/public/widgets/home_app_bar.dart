import 'package:flutter/material.dart';
import 'package:test_windows_app/core/theme/theme_color.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return AppBar(
      automaticallyImplyLeading: false, // 🚫 Ngăn nút mặc định bên trái
      backgroundColor: AppColors.background,
      elevation: 0,
      titleSpacing: 20,
      title: Row(
        children: [
          Image.asset("lib/core/assets/Logo_xe_dien_EV.png", height: 40),
          const Spacer(),
          if (!isMobile) _buildDesktopMenu(),
        ],
      ),
      // ✅ Flutter tự thêm hamburger bên phải nếu có endDrawer
      actions: isMobile
          ? [
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  );
                },
              ),
            ]
          : null,
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentOrange,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: const Text("MUA NGAY"),
        ),
        const SizedBox(width: 12),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: const Text("LÁI THỬ MIỄN PHÍ"),
        ),
        const SizedBox(width: 12),
        TextButton(
          onPressed: () {},
          child: const Text("Sản phẩm", style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Giới thiệu", style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Liên hệ", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
