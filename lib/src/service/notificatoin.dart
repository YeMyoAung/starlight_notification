part of starlight_notification;

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class StarlightNotificationService {
  StarlightNotificationService._();

  ///android setting
  static const AndroidInitializationSettings _initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');

  ///ios setting
  static const IOSInitializationSettings _initializationSettingsIOS =
      IOSInitializationSettings();

  ///initialization setting
  static const InitializationSettings _initializationSettings =
      InitializationSettings(
    android: _initializationSettingsAndroid,
    iOS: _initializationSettingsIOS,
  );

  ///android channel
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'com.starlight.notification',
    'Powered by Starlight Studio',
    importance: Importance.max,
  );

  ///if you want to use [StarlightNotificationService]
  ///you need to initalize [StarlightNotificationService] class
  static Future<void> setup({
    void Function(String?)? onSelectNotification,
  }) async {
    await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    await _flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onSelectNotification: onSelectNotification,
    );
    try {
      if (Platform.isAndroid) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(_channel);
      }
      if (Platform.isIOS) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              sound: true,
              alert: true,
              badge: true,
            );
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Show a notification with an optional payload that will be passed back to
  /// the app when a notification is tapped.
  static Future<void> show(StarlightNotification notification) async {
    try {
      await _flutterLocalNotificationsPlugin.show(
        notification._id,
        notification._title,
        notification._body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            importance: Importance.min,
          ),
          iOS: IOSNotificationDetails(
            presentSound: true,
            presentAlert: true,
            presentBadge: true,
            subtitle: _channel.name,
          ),
        ),
        payload: notification._payload,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// Cancel/remove the notification with the specified title.
  ///
  /// This applies to notifications that have been scheduled and those that
  /// have already been presented.
  static Future<void> cancel(String title) async {
    try {
      await _flutterLocalNotificationsPlugin.cancel(title.hashCode);
    } catch (e) {
      rethrow;
    }
  }

  /// Cancels/removes all notifications.
  ///
  /// This applies to notifications that have been scheduled and those that
  /// have already been presented.
  static Future<void> cancelAll() async {
    try {
      await _flutterLocalNotificationsPlugin.cancelAll();
    } catch (e) {
      rethrow;
    }
  }
}
