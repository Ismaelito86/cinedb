//import 'package:cinedb/config/router/app_router.dart';
import 'package:cinedb/core/theme/app_theme.dart';
import 'package:cinedb/firebase_options.dart';
import 'package:cinedb/presentation/providers/profile_provider.dart';
import 'package:cinedb/presentation/screens/details_screen.dart';
import 'package:cinedb/presentation/screens/home_screen.dart';
import 'package:cinedb/presentation/screens/maps_screen.dart';
import 'package:cinedb/presentation/screens/movies_screen.dart';
import 'package:cinedb/presentation/screens/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinedb/dependency_injection.dart';
import 'package:provider/provider.dart';

import 'package:cinedb/presentation/providers/movies_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DependencyInjection.init();
  runApp(const CineDb());
}

class CineDb extends StatelessWidget {
  const CineDb({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => ProfileProvider(), lazy: true),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      //routerConfig: appRouter,
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen(),
        'movies': (_) => const MovieScreen(),
        'profile': (_) => const ProfileScreen(),
        'maps': (_) => const MapsScreen(),
      },
      theme: AppTheme().getTheme(),
    );
  }
}
