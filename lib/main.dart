import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // Start the app on the home page
      initialRoute: '/home',

      routes: {
        '/home': (context) => const HomePage(title: 'adollarclass'),
        '/services': (context) => const ServicesPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
