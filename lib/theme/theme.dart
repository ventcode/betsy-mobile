import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x292c36FF)),
    colorScheme: const ColorScheme(
        primary: Color.fromARGB(0, 43, 43, 101),
        onPrimary: Colors.white,
        secondary: Color(0x292c36FF),
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
        brightness: Brightness.dark,
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Color(0x292c36FF)),
      titleSmall: TextStyle(fontSize: 18, color: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0x292c36FF),
      iconTheme: IconThemeData(color: Colors.white),
    ));



// THEME:
// FF499E
// D264B6
// A480CF
// 779BE7
// 49B6FF