import 'package:flutter/material.dart';

class StyleConstants {
  // Colors
  static const primaryColor = Color(0xFFE67E22);
  static const accentColor = Color(0xFF3498DB);
  static const backgroundColor = Color(0xFFF5F6FA);
  static const textColor = Color(0xFF2C3E50);
  static const surfaceColor = Colors.white;

  // Text Styles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'PTSerif',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'PTSerif',
    fontSize: 16,
    color: textColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: 'PTSerif',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle inputText = TextStyle(
    fontFamily: 'PTSerif',
    fontSize: 16,
    color: Colors.black87,
  );

  // Common Decorations
  static const gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF2C3E50), Color(0xFF34495E)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  static final borderRadius = BorderRadius.circular(16.0);
}
