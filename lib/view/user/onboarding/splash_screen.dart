import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the login screen after a delay
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/linkup.png',
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
