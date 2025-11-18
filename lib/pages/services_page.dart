import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context), // Go back to previous page
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
