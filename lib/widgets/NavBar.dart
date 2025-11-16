import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentRoute == '/home' ? Colors.yellow : Colors.white,
              ),
              onPressed: () {
                if (currentRoute != '/home') {
                  Navigator.pushNamed(context, '/home');
                }
              },
            ),

            // Services
            IconButton(
              icon: Icon(
                Icons.design_services,
                color: currentRoute == '/services' ? Colors.yellow : Colors.white,
              ),
              onPressed: () {
                if (currentRoute != '/services') {
                  Navigator.pushNamed(context, '/services');
                }
              },
            ),

            // Profile
            IconButton(
              icon: Icon(
                Icons.person,
                color: currentRoute == '/login' ? Colors.yellow : Colors.white,
              ),
              onPressed: () {
                if (currentRoute != '/login') {
                  Navigator.pushNamed(context, '/login');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
