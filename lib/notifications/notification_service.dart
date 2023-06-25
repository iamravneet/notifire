import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{


  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();



  //after this create a method initialize to initialize  localNotification

  static void initialize() {


    Future<void> _onDidReceiveLocalNotification(
        int? id, String? title, String? body, String? payload) async {
      // Handle received notification here
      print('Received notification: id=$id, title=$title, body=$body, payload=$payload');
    }

    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestAlertPermission: true, // Request alert permission
      requestBadgePermission: true, // Request badge permission
      requestSoundPermission: true, // Request sound permission
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    // initializationSettings  for Android and Ios
    InitializationSettings initializationSettings =
    const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );


    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (id) async {
        print("onSelectNotification");
        print('payload ${id.payload}');
        print('payload ${id.id}');
      },
    );
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
              "notifire",
              "notifire",
              importance: Importance.max,
              priority: Priority.high,
              visibility: NotificationVisibility.public,
              fullScreenIntent: true,
              styleInformation: BigTextStyleInformation(''),
              ongoing: false
            //largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
          ),
          iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true
          )
      );

      print('mess = ${message}');
      await _notificationsPlugin.show(
        id,
        message.notification?.title ?? '',
        message.notification?.body ?? '',
        notificationDetails,
        payload: (message.data['content_id'] != null)?message.data['content_id']:message.data['type'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }

}