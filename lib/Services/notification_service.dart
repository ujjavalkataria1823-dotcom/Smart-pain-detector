import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _notifications.initialize(settings,
        onDidReceiveNotificationResponse: (details) {});
  }

  static Future show(String title, String body) async {
    const android = AndroidNotificationDetails(
      'id',
      'channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    await _notifications.show(0, title, body,
        const NotificationDetails(android: android));
  }
}