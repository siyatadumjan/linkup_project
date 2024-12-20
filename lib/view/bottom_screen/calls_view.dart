import 'package:flutter/material.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> calls = [
      {
        'name': 'Supragya Basnet',
        'time': 'Today, 10:30 AM',
        'type': 'incoming',
      },
      {
        'name': 'Susmita Bishwakarma',
        'time': 'Yesterday, 5:45 PM',
        'type': 'outgoing',
      },
      {
        'name': 'Ashmita sahi',
        'time': 'Yesterday, 3:15 PM',
        'type': 'missed',
      },
      {
        'name': 'Ashmita B',
        'time': 'Monday, 8:00 AM',
        'type': 'incoming',
      },
      {
        'name': 'Ashish Mool',
        'time': 'Sunday, 7:45 PM',
        'type': 'outgoing',
      },
      {
        'name': 'Lucy',
        'time': 'Sunday, 6:30 PM',
        'type': 'missed',
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20), // Adjust to position the "Calls" text
          const Text(
            'Calls',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: calls.length,
              itemBuilder: (context, index) {
                final call = calls[index];
                final IconData callIcon;
                final Color iconColor;

                // Determine the call type icon and color
                switch (call['type']) {
                  case 'incoming':
                    callIcon = Icons.call_received;
                    iconColor = Colors.green;
                    break;
                  case 'outgoing':
                    callIcon = Icons.call_made;
                    iconColor = Colors.blue;
                    break;
                  case 'missed':
                    callIcon = Icons.call_missed;
                    iconColor = Colors.red;
                    break;
                  default:
                    callIcon = Icons.phone;
                    iconColor = Colors.grey;
                }

                return ListTile(
                  leading: Icon(
                    callIcon,
                    color: iconColor,
                  ),
                  title: Text(
                    call['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(call['time']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone, color: Colors.green),
                    onPressed: () {
                      // Action when call button is tapped
                      print('Calling ${call['name']}');
                    },
                  ),
                  onTap: () {
                    // Action when call item is tapped
                    print('Tapped on ${call['name']}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
