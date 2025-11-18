import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                context,
                '/services',
              ), // Go to Services page
              child: const Text('Go to Services Page!'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/login'), // Go to Login page
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
