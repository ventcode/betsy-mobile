import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    primary: Color(0xff162956),
    onPrimary: Colors.white,
    secondary: Color(0xff162956),
    onSecondary: Color(0xff162956),
    error: Colors.redAccent,
    onError: Colors.white,
    brightness: Brightness.dark,
    background: Color(0xFFFAFAFA),
    onBackground: Colors.white,
    surface: Colors.white, // This is Cards etc colors
    onSurface: Colors.black, // This is mostly text color
  ),
  cardTheme: const CardTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      color: Colors.white),
  scaffoldBackgroundColor: const Color.fromARGB(215, 255, 255, 255),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 24, color: Color(0x292c36FF)),
    titleSmall: TextStyle(fontSize: 24, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    bodySmall: TextStyle(fontSize: 14, color: Colors.black87),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.black,
    focusColor: Colors.black,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff162956)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff162956), width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff162956)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white, // This is background on app header
    iconTheme: IconThemeData(color: Color(0xFF292C36)),
    titleTextStyle: TextStyle(color: Color(0xFF292C36)),
    shadowColor: Colors.black,
  ),
);
