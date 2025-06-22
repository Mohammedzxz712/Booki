import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../generated/assets.dart';
import '../widgets/card_home_item.dart';
import '../widgets/category_chip.dart';
import '../widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.offWhite,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFormField(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Image.asset(Assets.imagesSuffix),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                hintText: 'Find What You Need Here',
                validator: (value) {},
              ),
              verticalSpace(10),
              const Text('Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              verticalSpace(10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(label: 'Fantasy'),
                    CategoryChip(label: 'Romance'),
                    CategoryChip(label: 'Mystery'),
                    CategoryChip(label: 'Biographies'),
                  ],
                ),
              ),
              verticalSpace(16),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BookCard(),
                    BookCard(),
                    BookCard(),
                  ],
                ),
              ),
              verticalSpace(12),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryChip(label: 'Latest'),
                    CategoryChip(label: 'Best Seller'),
                    CategoryChip(label: 'Top Rated'),
                    CategoryChip(label: 'Most Popular'),
                  ],
                ),
              ),
              verticalSpace(16),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BookCard(),
                    BookCard(),
                    BookCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
