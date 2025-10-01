import 'package:flutter/material.dart';
import 'package:test_windows_app/core/theme/theme_color.dart';

class ModelSelector extends StatelessWidget {
  const ModelSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("CHỌN MẪU XE", style: Theme.of(context).textTheme.titleMedium),
        Text(
          "KHOE CÁ TÍNH",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.accentOrange,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          children: [
            _buildModelButton("MODEL A", AppColors.accentRed),
            _buildModelButton("MODEL B", AppColors.accentBlue),
            _buildModelButton("LIÊN HỆ", AppColors.primaryDark),
          ],
        ),
      ],
    );
  }

  Widget _buildModelButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(label),
    );
  }
}
