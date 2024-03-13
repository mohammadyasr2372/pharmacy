import 'package:flutter/material.dart';
import 'package:login_signup/theme/theme.dart';

ThemeData getThemeData({bool isLight = true}) {
  if (isLight) {
    return ThemeData(
      useMaterial3: false,
      appBarTheme: const AppBarTheme(
        // backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      // colorSchemeSeed: Colors.pink,

      // scaffoldBackgroundColor: Colors.amber,
    );
  } else {
    return ThemeData(
      // useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: darkColorScheme,
      useMaterial3: false,
      // app bar theme config
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      // colorSchemeSeed: Colors.red,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.amber),
      scaffoldBackgroundColor: const Color.fromARGB(255, 12, 10, 6),
    );
  }
}
