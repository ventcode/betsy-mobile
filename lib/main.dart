import 'package:betsy_mobile/screens/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/dasboard',
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/dasboard': (context) => const AuthScreen(),
        '/new-bet': (context) => const AuthScreen(),
        '/bet-details': (context) => const AuthScreen(),
        '/challenge': (context) => const AuthScreen(),
        '/summary': (context) => const AuthScreen(),
      },
    );
  }
}
