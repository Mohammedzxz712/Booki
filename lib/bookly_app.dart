
import 'package:bookly/core/routing/app_routes.dart';
import 'package:bookly/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BooklyApp extends StatelessWidget {

  final AppRoutes appRouter;

  const BooklyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
         // primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute:Routes.splash,
         onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
      ),
    );
  }
}