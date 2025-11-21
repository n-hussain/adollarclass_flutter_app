import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../widgets/navbar.dart'; 

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _authService = AuthService();
  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
  }

  void logout() async {
    await _authService.logout();
    Navigator.pushReplacementNamed(context, '/login');
  }

  void deleteAccount() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text(
          'Are you sure you want to delete your account? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _authService.deleteUser();
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = currentUser?.email ?? 'Unknown';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Text(
                email[0].toUpperCase(),
                style: const TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: logout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Logout'),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: deleteAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
      extendBody: true,
    );
  }
}
