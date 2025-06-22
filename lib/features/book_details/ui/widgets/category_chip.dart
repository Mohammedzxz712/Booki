import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: -4),
      // Reduce padding
      label: Text(
        label,
        style:
        const TextStyle(color: Colors.black, fontSize: 12), // Smaller font
      ),
      visualDensity: VisualDensity.compact, // Reduce height
    );
  }
}