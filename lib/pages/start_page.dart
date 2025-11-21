import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    const baseColor = Color(0xFF3EB489); 

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [

          Container(
            width: double.infinity,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Center(
              child: Image.asset(
                'assets/images/adollarclass-logo.jpg',
                width: 260,
                height: 260,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 50),

          Center(
            child: Column(
              children: [

                SizedBox(
                  width: 220,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: baseColor, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      foregroundColor: baseColor,
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: baseColor, 
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
