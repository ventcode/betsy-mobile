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
      onSurface: Colors.black, // This is text color
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Color(0x292c36FF)),
      titleSmall: TextStyle(fontSize: 18, color: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white, // This is background on app header
      iconTheme: IconThemeData(color: Color(0xFF292C36)),
      titleTextStyle: TextStyle(color: Color(0xFF292C36)),
      shadowColor: Colors.black,
    ),
   );
