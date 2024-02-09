import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    onPrimary: Color(0xFFB7935F),
    primary: Color(0xFFB7935F),
    secondary: Colors.black,
    inversePrimary: Colors.white,
    onBackground: Color(0xFFF8F8F8),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    onPrimary: Color(0xFFFACC1D),
    primary: Color(0xFF141A2E),
    secondary: Color(0xFFFACC1D),
    inversePrimary: Colors.black,
    onBackground: Color(0xFF141A2E),
  ),
);
