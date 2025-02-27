import 'package:flutter/material.dart';
import '../constants/style_constants.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: StyleConstants.primaryColor,
    scaffoldBackgroundColor: StyleConstants.backgroundColor,
    colorScheme: ColorScheme.light(
      primary: StyleConstants.primaryColor,
      secondary: StyleConstants.accentColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: StyleConstants.headlineLarge,
      bodyLarge: StyleConstants.bodyLarge,
      labelLarge: StyleConstants.buttonText,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: StyleConstants.buttonText,
        backgroundColor: StyleConstants.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: StyleConstants.borderRadius,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: StyleConstants.borderRadius,
        borderSide: BorderSide.none,
      ),
      hintStyle: StyleConstants.inputText.copyWith(color: Colors.grey),
    ),
  );
}
