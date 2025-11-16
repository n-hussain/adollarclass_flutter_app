import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
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

                // LOGIN BUTTON
                SizedBox(
                  width: 220,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Colors.black, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // CONTINUE AS GUEST BUTTON (might remove in future)
                SizedBox(
                  width: 220,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Colors.black, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Continue as Guest',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
