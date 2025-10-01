import 'package:flutter/material.dart';
import 'package:test_windows_app/core/theme/theme_color.dart';
class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Banner giữ đúng tỉ lệ gốc
        AspectRatio(
          aspectRatio: 16 / 6, // chỉnh theo tỉ lệ ảnh banner của bạn
          child: Image.asset(
            "lib/core/assets/banner01.png",
            width: double.infinity,
            fit: BoxFit.contain, // BoxFit.contain 
          ),
        ),

        // Button overlay
        Positioned(
          bottom: 20,
          left: 20,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentOrange,
            ),
            child: const Text("GHÉ STORE NGAY"),
          ),
        ),
      ],
    );
  }
}
