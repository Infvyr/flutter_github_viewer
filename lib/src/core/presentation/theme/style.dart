import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        letterSpacing: 1.15,
      ),
      labelLarge: TextStyle(fontSize: 18),
      labelMedium: TextStyle(fontSize: 16),
      labelSmall: TextStyle(fontSize: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(40, 48),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
    ).copyWith(
      background: Colors.white,
    ),
  );
}
