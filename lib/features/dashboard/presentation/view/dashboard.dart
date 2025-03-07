import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/chat_page.dart';
import '../widgets/profile_page.dart';
import '../widgets/search_page.dart'; // Add this new import
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'dart:math';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<int>? _proximitySubscription;
  DateTime? _lastShakeTime;
  DateTime? _lastProximityTime;

  final List<Widget> _pages = [
    const ChatPage(),
    const SearchPage(), // Add SearchPage here
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _initShakeDetection();
    _initProximitySensor();
  }

  void _initShakeDetection() {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      double acceleration =
          sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

      // Detect shake when acceleration is more than 50
      if (acceleration > 50) {
        final now = DateTime.now();
        if (_lastShakeTime == null ||
            now.difference(_lastShakeTime!) > const Duration(seconds: 5)) {
          _lastShakeTime = now;
          _showIssuesDialog();
        }
      }
    });
  }

  void _initProximitySensor() {
    _proximitySubscription = ProximitySensor.events.listen((int proximity) {
      final now = DateTime.now();
      print('Proximity: $proximity');
      if (proximity > 0 &&
          (_lastProximityTime == null ||
              now.difference(_lastProximityTime!) >
                  const Duration(seconds: 5))) {
        _lastProximityTime = now;
        _showAppInfoDialog();
      }
    });
  }

  void _showIssuesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report Issues'),
        content: const Text('Got an issue with the app? Let us know!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              // Add functionality to report issues
              Navigator.of(context).pop();
            },
            child: const Text('Report Issue'),
          ),
        ],
      ),
    );
  }

  void _showAppInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About LinkUp'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LinkUp: Connect with people nearby'),
            SizedBox(height: 8),
            Text('Support: support@linkupapp.com'),
            SizedBox(height: 8),
            Text('Developed by: Siyata Dumjan'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    _proximitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryPink,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
