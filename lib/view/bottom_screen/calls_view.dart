import 'package:flutter/material.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> calls = [
      {
        'name': 'John Doe',
        'time': 'Today, 10:30 AM',
        'type': 'incoming',
      },
      {
        'name': 'Alice Smith',
        'time': 'Yesterday, 5:45 PM',
        'type': 'outgoing',
      },
      {
        'name': 'Robert Brown',
        'time': 'Yesterday, 3:15 PM',
        'type': 'missed',
      },
      {
        'name': 'Emma Wilson',
        'time': 'Monday, 8:00 AM',
        'type': 'incoming',
      },
      {
        'name': 'Olivia Johnson',
        'time': 'Sunday, 7:45 PM',
        'type': 'outgoing',
      },
      {
        'name': 'Liam Martinez',
        'time': 'Sunday, 6:30 PM',
        'type': 'missed',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calls'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF66C4), // Match theme
      ),
      body: ListView.builder(
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
    );
  }
}
