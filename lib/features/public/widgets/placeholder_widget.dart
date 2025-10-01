import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final String title;
  final String description;

  const PlaceholderWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.electric_car, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
