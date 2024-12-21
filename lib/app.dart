import 'package:flutter/material.dart';
import 'package:linkup_project/view/user/home/bottom_navigation.dart';
import 'package:linkup_project/view/user/login_screen.dart';
import 'package:linkup_project/view/user/onboarding/onboarding.dart';
import 'package:linkup_project/view/user/onboarding/splash_screen.dart';
import 'package:linkup_project/view/user/register_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenView(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const SignupPage(),
        '/homepage': (context) => const BottomNavigationView(),
      },
    );
  }
}
