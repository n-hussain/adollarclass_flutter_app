import 'package:flutter/material.dart';
import '../classes.dart';
import '../widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final String url;

  const ServiceCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.url,
  });

  void openWebsite(BuildContext context) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openWebsite(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
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

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: sections.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,          
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final service = sections[index];
            return ServiceCard(
              name: service.name,
              description: service.smallDescription,
              imagePath: service.photo,
              url: "https://calendly.com/book-adollarclass/30min",
            );
          },
        ),
      ),

      bottomNavigationBar: const NavBar(),
      extendBody: true,
    );
  }
}
