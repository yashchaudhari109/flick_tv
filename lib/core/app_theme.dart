import 'package:flutter/material.dart';

class AppTheme {
  // Define a dark theme for the application, suitable for a video streaming app.
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, // Overall dark mode
    primaryColor: Colors.deepPurple, // A deep purple accent
    scaffoldBackgroundColor: Colors.black, // Pure black background for pages
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black, // Dark app bar
      foregroundColor: Colors.white, // White text/icons on app bar
      elevation: 0, // No shadow under the app bar
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.white54,
        fontSize: 14,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.dark,
    ).copyWith(secondary: Colors.redAccent),
  );
}