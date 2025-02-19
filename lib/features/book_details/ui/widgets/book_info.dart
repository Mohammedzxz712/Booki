import 'package:bookly/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookInfoCard extends StatelessWidget {
  final String title1, value1, title2, value2, title3, value3;

  const BookInfoCard({
    super.key,
    required this.title1,
    required this.value1,
    required this.title2,
    required this.value2,
    required this.title3,
    required this.value3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      width: MediaQuery.of(context).size.width/1.5,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // First Column
          _buildInfoColumn(title1, value1),

          // Divider
          _buildDivider(),

          // Second Column
          _buildInfoColumn(title2, value2),

          // Divider
          _buildDivider(),

          // Third Column
          _buildInfoColumn(title3, value3),
        ],
      ),
    );
  }

  // Helper Widget: Column for Title & Value
  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.black54)),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      ],
    );
  }

  // Helper Widget: Divider
  Widget _buildDivider() {
    return Container(
      height: 52.h,
      width: 1.5,
      color: ColorsManager.maincolor,
    );
  }
}
