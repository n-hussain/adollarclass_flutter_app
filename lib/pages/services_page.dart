import 'package:flutter/material.dart';
import '../classes.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pop(context), // Go back to previous page
              child: const Text('Back to Home'),
            ),

            const SizedBox(height: 20),

            // Expanded so the list can scroll if needed
            Expanded(
              child: ListView.separated(
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final service = sections[index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          25,
                        ), // corner radius
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            service.photo,
                            fit: BoxFit.contain, // fills the available space
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          service.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          service.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16), // spacing between items
              ),
            ),
          ],
        ),
      ),
    );
  }
}
