import 'package:flutter/material.dart';

class AppTheme {
  static const Color backgroundColor = Color(0xFFF2F2F2);
  static const Color primaryColor = Color(0xFF9C4696);
  static const Color accentColor = Color(0xFFFF6600);

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: accentColor,
        primary: primaryColor,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Lato',
          fontSize: 18,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontFamily: 'PlayfairDisplay',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: 'PlayfairDisplay',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontFamily: 'Lato'),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF121212),
      primaryColor: primaryColor,
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: accentColor,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Lato',
          fontSize: 18,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontFamily: 'PlayfairDisplay',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF9C4696),
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: 'PlayfairDisplay',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontFamily: 'Lato'),
        ),
      ),
      cardColor: const Color(0xFF1E1E1E),
      iconTheme: const IconThemeData(color: Colors.white70),
    );
  }

}
