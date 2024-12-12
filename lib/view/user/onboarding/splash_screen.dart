import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the login screen after a delay
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
          context, '/onboarding'); // Navigate to register screen
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace Lottie animation with your logo
              Image.asset(
                'assets/images/linkup.png', // Path to your logo
                height: 200, // Adjust the height of your logo
                width: 200, // Adjust the width of your logo if necessary
                fit: BoxFit.contain, // Maintain aspect ratio
              ),
              // Optionally, you can add a text or any other widget here
              const SizedBox(height: 20),
              const CircularProgressIndicator(), // Loading indicator (optional)
            ],
          ),
        ),
      ),
    );
  }
}
