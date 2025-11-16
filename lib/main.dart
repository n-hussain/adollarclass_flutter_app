import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/start_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

      // NEW: start page is first
      initialRoute: '/start',

      routes: {
        '/start': (context) => const StartPage(),
        '/home': (context) => const HomePage(title: 'adollarclass'),
        '/services': (context) => const ServicesPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
