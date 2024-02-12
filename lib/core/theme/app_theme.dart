import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromARGB(255, 64, 255, 217),
      brightness: Brightness.dark,
      appBarTheme: appBarTheme(),
      textTheme: const TextTheme(
        titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        titleLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
      ),
    );
  }

  AppBarTheme appBarTheme() {
    return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
      titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    );
  }
}
