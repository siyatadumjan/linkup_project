import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'chat_detail_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryPink,
        title: const Text(
          'LinkUp Chats',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting section
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, User!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'You have 3 unread messages',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Recent chats heading
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Recent Chats',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Chat list
          Expanded(
            child: ListView(
              children: const [
                ChatListItem(
                  name: 'Supragya Basnet',
                  lastMessage: 'Hey! How are you doing?',
                  time: '10:30 AM',
                  avatarUrl: 'https://randomuser.me/api/portraits/women/11.jpg',
                  unreadCount: 2,
                ),
                ChatListItem(
                  name: 'Rangeen Twiti',
                  lastMessage: 'Are we still meeting today?',
                  time: '9:15 AM',
                  avatarUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
                  unreadCount: 1,
                ),
                ChatListItem(
                  name: 'Sital Maskey',
                  lastMessage: 'I sent you the files you requested.',
                  time: 'Yesterday',
                  avatarUrl: 'https://randomuser.me/api/portraits/women/33.jpg',
                  unreadCount: 0,
                ),
                ChatListItem(
                  name: 'Kiran Rana',
                  lastMessage: 'Thanks for your help!',
                  time: 'Yesterday',
                  avatarUrl: 'https://randomuser.me/api/portraits/men/44.jpg',
                  unreadCount: 0,
                ),
                ChatListItem(
                  name: 'Asmita Shahi',
                  lastMessage: 'Let me know when you are free to talk.',
                  time: 'Monday',
                  avatarUrl: 'https://randomuser.me/api/portraits/women/55.jpg',
                  unreadCount: 0,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryPink,
        child: const Icon(Icons.chat, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;
  final int unreadCount;

  const ChatListItem({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    required this.unreadCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          lastMessage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            if (unreadCount > 0)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primaryPink,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailPage(
                name: name,
                avatarUrl: avatarUrl,
              ),
            ),
          );
        },
      ),
    );
  }
}
