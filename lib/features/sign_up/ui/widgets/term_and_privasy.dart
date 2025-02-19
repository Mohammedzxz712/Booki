import 'package:bookly/core/theming/colors.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onChanged;

  const TermsAndPrivacyCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: ColorsManager.maincolor,
        ),
        const Text.rich(
          TextSpan(
            text: "I agree to the ", // Default text
            style: TextStyle(
              fontSize: 16,
              color: Colors.black, // Default color
            ),
            children: [
              TextSpan(
                text: "terms", // "terms" part
                style: TextStyle(
                  color: ColorsManager.maincolor, // Color for "terms"
                  fontWeight: FontWeight.bold, // Optional: Add bold style
                ),
              ),
              TextSpan(
                text: " And ", // "And" part
                style: TextStyle(
                  color: Colors.black, // Default color
                ),
              ),
              TextSpan(
                text: "privacy \npolicy", // "privacy policy" part
                style: TextStyle(
                  color: ColorsManager.maincolor, // Color for "privacy policy"
                  fontWeight: FontWeight.bold, // Optional: Add bold style
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
