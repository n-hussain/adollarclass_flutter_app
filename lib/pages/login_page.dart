import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>?> getUserProfile(String uid) async {
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return doc.data();
    } catch (e) {
      print("Error fetching user profile: $e");
      return null;
    }
  }

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final user = await AuthService().login(email, password);

      if (user != null) {
        final profile = await getUserProfile(user.uid);
        final username = profile?['username'] ?? 'User';

        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: {'username': username},
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Register if needed.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login error: $e')),
      );
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const mintGreen = Color(0xFF3EB489);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,

      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please login to your account',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),
              style: const TextStyle(color: Colors.black),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            isLoading
                ? const CircularProgressIndicator(color: Color(0xFF3EB489))
                : SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: login,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: mintGreen, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mintGreen,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                'Don\'t have an account? Register',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
