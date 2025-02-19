import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/layout_cubit.dart';
import '../../logic/layout_state.dart';


class LayoutScreen extends StatelessWidget {
  static const String routeName = "layout";

  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomsNavBar,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeBottomScreen(value);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
