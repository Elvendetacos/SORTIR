import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111419),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          NotificationItem(
            color: Colors.purple,
            title: 'Match',
            subtitle: 'Now, you and Alan made a match',
          ),
          NotificationItem(
            color: Colors.green,
            title: 'Event',
            subtitle: 'You added "Kunfu 4" to favorites',
          ),
          NotificationItem(
            color: Colors.grey,
            title: 'Profile',
            subtitle: 'Edit your profile today',
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;

  NotificationItem({required this.color, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 10,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
