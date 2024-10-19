import 'package:flutter/material.dart';

class LoginTextContainer extends StatelessWidget {
  const LoginTextContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20, top: 20),
      child: Column(
        children: [
          const Text(
            'Welcome to Headspace',
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          const SizedBox(height: 10),
          Text('Support for all of life\'s moments.',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8), fontSize: 18)),
          const SizedBox(height: 100),

          // Create an account button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: const Color.fromARGB(255, 42, 93, 205),
                foregroundColor: Colors.white,
              ),
              child: const Text('Create an account'),
            ),
          ),
          const SizedBox(height: 20),

          // Log in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: const Color.fromARGB(255, 43, 45, 83),
                foregroundColor: Colors.white,
              ),
              child: const Text('Log in'),
            ),
          ),
        ],
      ),
    );
  }
}
