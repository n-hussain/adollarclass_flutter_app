import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../classes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const darkGrey = Color(0xFF4A4A4A);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,

        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [

            //Loop through service items for now (static)
            for (final service in sections)
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        service.photo,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 10),

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
          ],
        ),
      ),

      bottomNavigationBar: const NavBar(),
      extendBody: true,
    );
  }
}
