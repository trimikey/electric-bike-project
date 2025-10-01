import 'package:flutter/material.dart';
class NewProducts extends StatelessWidget {
  const NewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "SẢN PHẨM MỚI",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 24),

          // Responsive Layout
          isMobile
              ? Column(
                  children: [
                    _buildProductCard(
                      image: "lib/core/assets/xe-vin-den.jpg",
                      title: "VIN SOOBIN",

                    ),
                    const SizedBox(height: 20),
                    _buildProductCard(
                      image: "lib/core/assets/xe-vin-vang.png",
                      title: "VIN SOOBIN",
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildProductCard(
                        image: "lib/core/assets/xe-vin-den.jpg",
                        title: "VIN SOOBIN",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildProductCard(
                        image: "lib/core/assets/xe-vin-vang.png",
                        title: "VIN SOOBIN",
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildProductCard({required String image, required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 4 / 3, // card luôn đồng đều
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Tìm hiểu thêm →",
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
