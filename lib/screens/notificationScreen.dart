import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'notificationDetailsPage.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
    with SingleTickerProviderStateMixin {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Nouvelle réservation confirmée',
      message: 'Votre hôte à Marrakech a accepté votre réservation.',
      type: NotificationType.booking,
      dateTime: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
    ),
    NotificationItem(
      title: 'Message reçu',
      message:
          'Laura : "Bienvenue ! N\'hésitez pas si vous avez des questions."',
      type: NotificationType.message,
      dateTime: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    NotificationItem(
      title: 'Rappel de départ',
      message: 'Votre séjour à Nice commence demain. Préparez vos valises !',
      type: NotificationType.reminder,
      dateTime: DateTime.now().subtract(const Duration(hours: 5)),
      isRead: false,
    ),
  ];

  final Duration animationDuration = const Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return AnimatedSwitcher(
            duration: animationDuration,
            transitionBuilder: (child, animation) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0.1),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: Slidable(
              key: ValueKey(notification.title),
              closeOnScroll: true,
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                extentRatio: 0.75,
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      setState(() {
                        notifications.removeAt(index);
                      });
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Supprimer',
                  ),
                  SlidableAction(
                    onPressed: (_) {
                      // Simule une archive ou action quelconque
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notification archivée')),
                      );
                    },
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archiver',
                  ),
                  SlidableAction(
                    onPressed: (_) {
                      setState(() {
                        notifications[index] =
                            notification.copyWith(isRead: !notification.isRead);
                      });
                    },
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    icon: notification.isRead
                        ? Icons.mark_email_unread
                        : Icons.mark_email_read,
                    label:
                        notification.isRead ? 'Marquer non lu' : 'Marquer lu',
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    notifications[index] = notification.copyWith(isRead: true);
                  });
                  Get.to(
                      () => NotificationDetailPage(notification: notification));
                },
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: 1,
                  child: NotificationCard(notification: notification),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

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

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('dd MMM, HH:mm').format(notification.dateTime);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.grey[100] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: notification.isRead
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 24,
            child: Icon(getIconForType(notification.type), color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontWeight:
                        notification.isRead ? FontWeight.w500 : FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          if (!notification.isRead)
            Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.only(left: 8),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

enum NotificationType { booking, message, reminder }

class NotificationItem {
  final String title;
  final String message;
  final NotificationType type;
  final DateTime dateTime;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.type,
    required this.dateTime,
    required this.isRead,
  });

  NotificationItem copyWith({bool? isRead}) {
    return NotificationItem(
      title: title,
      message: message,
      type: type,
      dateTime: dateTime,
      isRead: isRead ?? this.isRead,
    );
  }
}
