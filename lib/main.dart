import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies/core/constants/hive_constats.dart';
import 'package:movies/core/routers/app_routes.dart';
import 'package:movies/core/shared_pref/cach_helper.dart';
import 'package:movies/core/shared_pref/service_locator.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/watch_list/data/model/movie_model_watchlist.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelWatchlistAdapter());
  await Hive.openBox(HiveConstats.hiveBox);
  setupLocator();
  await getIt<CachHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
