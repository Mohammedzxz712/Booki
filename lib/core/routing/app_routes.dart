import 'package:bookly/core/routing/routes.dart';
import 'package:bookly/features/card/ui/screen/card_screen.dart';
import 'package:bookly/features/favorite/ui/screen/favorite_screen.dart';
import 'package:bookly/features/home/ui/screen/home_screen.dart';
import 'package:bookly/features/login/logic/login_cubit.dart';
import 'package:bookly/features/onBoarding/ui/screen/onboarding_screen.dart';
import 'package:bookly/features/profile/ui/screen/profile_screen.dart';
import 'package:bookly/features/sign_up/logic/sign_up_cubit.dart';
import 'package:bookly/features/sign_up/ui/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/layout/logic/layout_cubit.dart';
import '../../features/layout/ui/screen/layout_screen.dart';
import '../../features/login/ui/screen/login_screen.dart';
import '../../features/profile/logic/profile_cubit.dart';
import '../../features/profile/ui/screen/update_screen.dart';
import '../../splash_screen.dart';

class AppRoutes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginScreen(),
            ));
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => SignUpCubit(),
              child: const SignUpScreen(),
            ));
      case Routes.home:
        return MaterialPageRoute(builder: (_) =>
            const HomeScreen()
        );
      case Routes.profile:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => ProfileCubit(),
              child: const ProfileScreen(),
            ));
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => const CardScreen());
      case Routes.favorites:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => LayoutCubit(),
              child: const LayoutScreen(),
            )
        );
    case Routes.update:
    return MaterialPageRoute(builder: (_) =>
    const UpdateScreen()
        );
      default:
        return MaterialPageRoute(builder: (_) =>
            Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Center(
                child: Text('Page Not Found'),
              ),
            )
        );
    }
  }

}