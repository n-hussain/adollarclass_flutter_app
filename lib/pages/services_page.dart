import 'package:flutter/material.dart';
import '../classes.dart';
import '../widgets/navbar.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGrey = Color(0xFF4A4A4A);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Services',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,        
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: sections.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final service = sections[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/booking');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          service.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: darkGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        color: darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const NavBar(),
      extendBody: true,
    );
  }
}
