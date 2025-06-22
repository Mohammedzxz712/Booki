import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0),
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: ColorsManager.maincolor),
        ),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12, // Smaller font size
          ),
        ),
        backgroundColor: ColorsManager.maincolor,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Smaller padding
        visualDensity: VisualDensity.compact, // Makes the chip more compact
      ),
    );
  }
}