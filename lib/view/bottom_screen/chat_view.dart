import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'Ashmita B',
        'message': 'Hey, how are you?',
        'time': '10:30 AM',
        'avatar':
            'https://via.placeholder.com/150/0000FF/808080?text=A', // Placeholder image
      },
      {
        'name': 'Supragya Basnet',
        'message': 'Did you finish the project?',
        'time': '9:45 AM',
        'avatar': 'https://via.placeholder.com/150/FF0000/FFFFFF?text=S',
      },
      {
        'name': 'kakashi',
        'message': 'Let’s catch up tomorrow!',
        'time': '8:15 AM',
        'avatar': 'https://via.placeholder.com/150/00FF00/000000?text=K',
      },
      {
        'name': 'Sherin',
        'message': 'Check this out!',
        'time': 'Yesterday',
        'avatar': 'https://via.placeholder.com/150/FFFF00/000000?text=S',
      },
      {
        'name': 'Mindu',
        'message': 'See you soon.',
        'time': 'Monday',
        'avatar': 'https://via.placeholder.com/150/FF00FF/FFFFFF?text=m',
      },
      {
        'name': 'Pranish',
        'message': 'Great job on the presentation!',
        'time': 'Sunday',
        'avatar': 'https://via.placeholder.com/150/000000/FFFFFF?text=L',
      },
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              // Wrap the Text widget with Center to center it horizontally
              child: const Text(
                'Chats',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat['avatar']!),
                    radius: 25,
                  ),
                  title: Text(
                    chat['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(chat['message']!),
                  trailing: Text(
                    chat['time']!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    // Action when chat is tapped
                    // You can navigate to a detailed chat screen here
                    print('Tapped on ${chat['name']}');
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
