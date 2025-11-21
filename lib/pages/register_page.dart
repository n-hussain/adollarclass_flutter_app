import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() => isLoading = true);

    final user = await AuthService().register(email, password, username);

    setState(() => isLoading = false);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful!')),
      );
      Navigator.pushReplacementNamed(context, '/services');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration failed. Try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const mintGreen = Color(0xFF3EB489);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: null,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white, 
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create a new account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black, 
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField(usernameController, 'Username'),
              const SizedBox(height: 15),
              _buildTextField(emailController, 'Email', email: true),
              const SizedBox(height: 15),
              _buildTextField(passwordController, 'Password', obscure: true),
              const SizedBox(height: 30),
              isLoading
                  ? const CircularProgressIndicator(color: mintGreen)
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: register,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: mintGreen, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text(
                          'Register',
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
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool obscure = false, bool email = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: email ? TextInputType.emailAddress : TextInputType.text,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54), 
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26), 
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF3EB489), width: 2),
        ),
      ),
    );
  }
}
