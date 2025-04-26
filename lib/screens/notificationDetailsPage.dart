import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'notificationScreen.dart';

class NotificationDetailPage extends StatelessWidget {
  final NotificationItem notification;

  const NotificationDetailPage({Key? key, required this.notification}) : super(key: key);

  IconData getIconForType(NotificationType type) {
    switch (type) {
      case NotificationType.booking:
        return Icons.hotel;
      case NotificationType.message:
        return Icons.message;
      case NotificationType.reminder:
        return Icons.notifications_active;
      default:
        return Icons.notifications;
    }
  }

  Color getColorForType(NotificationType type) {
    switch (type) {
      case NotificationType.booking:
        return Colors.teal;
      case NotificationType.message:
        return Colors.deepPurple;
      case NotificationType.reminder:
        return Colors.orangeAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('EEEE d MMMM yyyy • HH:mm', 'fr_FR').format(notification.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        elevation: 0.3,
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Hero(
                tag: notification.title,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: getColorForType(notification.type).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      getIconForType(notification.type),
                      size: 36,
                      color: getColorForType(notification.type),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                notification.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                formattedDate,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      notification.message,
                      style: const TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
