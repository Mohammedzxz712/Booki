import 'package:bloc/bloc.dart';
import 'package:bookly/features/card/ui/screen/card_screen.dart';
import 'package:bookly/features/favorite/ui/screen/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/presentation/ui/screen/home_screen.dart';
import '../../profile/logic/profile_cubit.dart';
import '../../profile/ui/screen/profile_screen.dart';
import 'layout_state.dart';



class LayoutCubit extends Cubit<LayoutState> {

  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomsNavBar = [

    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.home,
        size: 25.45.w,
        color: Colors.black, // Active icon color
      ),
      icon: Icon(
        Icons.home_outlined,
        size: 25.45.w,
        color: Colors.grey, // Inactive icon color
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(

      activeIcon: Icon(
        Icons.shopping_cart,
        size: 19.55.w,
        color: Colors.black, // Active icon color
      ),
      icon: Icon(
        Icons.shopping_cart,
        size: 19.55.w,
        color: Colors.grey, // Inactive icon color
      ),
      label: "Cart",

    ),
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.favorite,
        size: 26.13.w,
        color: Colors.black, // Active icon color
      ),
      icon: Icon(
        Icons.favorite_border,
        size: 26.13.w,
        color: Colors.grey, // Inactive icon color
      ),
      label: "Favorite",
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.person,
        size: 22.16.w,
        color: Colors.black, // Active icon color
      ),
      icon: Icon(
        Icons.person_outline,
        size: 22.16.w,
        color: Colors.grey, // Inactive icon color
      ),
      label: "Profile",
    ),
  ];
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const CardScreen(),
    const FavoriteScreen(),
    BlocProvider(
      create: (context) => ProfileCubit(),
      child: const ProfileScreen(),
    ),  ];
  void changeBottomScreen(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNav());
  }

}
