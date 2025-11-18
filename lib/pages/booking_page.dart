import 'package:flutter/material.dart';
import '../classes.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCard extends StatelessWidget {
  void openWebsite(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  final String name; // Variable passed in
  final String description;
  final String imagePath;

  // Constructor
  const ServiceCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, fit: BoxFit.contain),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    name != "iBare" ? "\$1" : 'FREE',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 11, 4, 4),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => name == "iBare"
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Not Avaliable!')),
                          )
                        : openWebsite(
                            "https://calendly.com/book-adollarclass/30min",
                          ), // if not IBare then go to calendly
                    child: name != "iBare"
                        ? const Text('Book')
                        : const Text('Not Avaliable'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final service = sections[index];

          return ServiceCard(
            name: service.name,
            description: service.smallDescription,
            imagePath: service.photo,
          ); // <-- MISSING SEMICOLON FIXED
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}


