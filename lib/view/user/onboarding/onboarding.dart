import 'package:flutter/material.dart';
import 'package:linkup_project/view/user/login_screen.dart';
// Import the home screen after onboarding


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _titles = [
    'Welcome to LinkUp',
    'Connect Instantly',
    'Start Chatting'
  ];
  final List<String> _descriptions = [
    'Welcome to LinkUp, your new favorite chat app! Stay connected with friends and family.',
    'Connect instantly with people, whether for a chat, video call, or group conversations.',
    'Start chatting now and make the most of the powerful features of LinkUp.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // PageView for onboarding pages
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: _titles[index],
                  description: _descriptions[index],
                );
              },
            ),
          ),

          // Bottom buttons (Skip, Next)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage == 2
                    ? const SizedBox()
                    : TextButton(
                        onPressed: () {
                          _pageController
                              .jumpToPage(2); // Skip to the last page
                        },
                        child: const Text('Skip',
                            style: TextStyle(fontSize: 16, color: Colors.blue)),
                      ),
                TextButton(
                  onPressed: () {
                    if (_currentPage == 2) {
                      // Navigate to the home screen after onboarding
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == 2 ? 'Start Chatting' : 'Next',
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
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

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingPage({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
