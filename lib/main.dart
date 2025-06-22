import 'package:bookly/features/book_details/domain/entity/book_details_entity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'bookly_app.dart';
import 'core/network/di/dependency_injection.dart';
import 'core/routing/app_routes.dart';
import 'features/book_details/data/model/book_cart_adapter.dart';
import 'features/favorite/model/book_favorite_model_adapter.dart';
import 'features/home/domain/entities/book_entitie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  ServiceLocator.setup();
  await Hive.initFlutter();

  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(BookDetailsEntityAdapter());
  await Hive.openBox<BookEntity>('favorites');
  await Hive.openBox<BookDetailsEntity>('cart');

  runApp(
    BooklyApp(
      appRouter: AppRoutes(),
    ),
  );
}
