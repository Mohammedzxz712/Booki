import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../generated/assets.dart';
import '../../controller/home_bloc.dart';
import '../../controller/home_event.dart';
import '../../controller/home_state.dart';

class SearchComponent extends StatefulWidget {

   TextEditingController searchController = TextEditingController();
  bool isSearching = false;


  SearchComponent({required this.searchController, required this.isSearching});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {

  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AppTextFormField(
          controller: widget.searchController,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: InkWell(
            onTap: () {
              final query = widget.searchController.text.trim();
              if (query.isNotEmpty) {
                setState(() {
                  widget.isSearching = true;
                });
                BlocProvider.of<HomeBloc>(context).add(
                    GetBookHomeSearchEvent(query));
              }
            },
            child: Image.asset(Assets.imagesSuffix),
          ),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 16),
          hintText: 'Find What You Need Here',
          onChanged: (value) {
            if (value!.isEmpty) {
              final query = widget.searchController.text.trim();
              if (query.isNotEmpty) {
                setState(() {
                  widget.isSearching = true;
                });
                BlocProvider.of<HomeBloc>(context).add(
                    GetBookHomeSearchEvent(query));
              }
            }
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a search query';
            }
            return null;
          },
        );
      },
    );
  }
}
