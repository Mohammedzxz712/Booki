import 'package:bookly/core/helpers/spacing.dart';
import 'package:bookly/core/widgets/app_text_form_field.dart';
import 'package:bookly/features/home/presentation/ui/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/network/api_constant.dart';
import '../../../../../core/network/di/dependency_injection.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../generated/assets.dart';
import '../../controller/home_bloc.dart';
import '../../controller/home_event.dart';
import '../../controller/home_state.dart';
import '../widgets/card_home_categories_item.dart';
import '../widgets/card_home_latest_item.dart';
import '../widgets/category_chip.dart';
import '../widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _initHomeBloc(),
      child: Scaffold(
        backgroundColor: ColorsManager.offWhite,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return AppTextFormField(
                      controller: _searchController,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: Image.asset(Assets.imagesSuffix),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      hintText: 'Find What You Need Here',
                      onChanged: (value) {
                        final query = _searchController.text.trim();
                        if (query.isEmpty) {
                          setState(() {
                            isSearching = false; // Show default UI
                          });
                        } else {
                          setState(() {
                            isSearching = true;
                          });
                          BlocProvider.of<HomeBloc>(context)
                              .add(GetBookHomeSearchEvent(query));
                        }
                      },
                      validator: (value) {

                      },
                    );
                  },
                ),

                verticalSpace(10),
                isSearching ? const SearchScreen() : _buildDefaultUI(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Initializes the HomeBloc with default events.
  HomeBloc _initHomeBloc() {
    return sl<HomeBloc>()
      ..add(const GetBookHomeEvent(ApiConstance.fantasyBooks))..add(
          const GetBookHomeBestSellerEvent(ApiConstance.latestBooks));
  }
  /// Builds the default UI when not searching.
  Widget _buildDefaultUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Categories'),
        verticalSpace(10),
        _buildCategoryList(),
        verticalSpace(16),
        const BookCardCategories(),
        verticalSpace(12),
        _buildCategoryChips(),
        verticalSpace(16),
        const BookCardBestSeller(),
      ],
    );
  }

  /// Builds a section title.
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  /// Builds the primary category list.
  Widget _buildCategoryList() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return InkWell(
                onTap: () =>
                    BlocProvider.of<HomeBloc>(context)
                        .add(category['event'] as HomeEvent),
                child: CategoryChip(label: category['label'] as String),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  /// Builds the secondary category chips list.
  Widget _buildCategoryChips() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: secondaryCategories.map((category) {
              return InkWell(
                onTap: () =>
                    BlocProvider.of<HomeBloc>(context)
                        .add(category['event'] as HomeEvent),
                child: CategoryChip(label: category['label'] as String),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}


