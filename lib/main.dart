import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notifire/screens/login/login_screen.dart';
import 'package:notifire/screens/registration/register_screen.dart';
import 'package:notifire/utilities/app_pages.dart';

import 'notifications/notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {

}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode:ThemeMode.dark,
        initialRoute: AppPages.initialPage,
        getPages: AppPages.pages,
        //theme: AppTheme.themeData,
      ),
    );
  }
}


