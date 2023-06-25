import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notifire/utilities/functions.dart';

import '../notifications/notification_service.dart';

class LoginController extends GetxController{
  var emailTextEditController = TextEditingController();
  var passwordTextEditController = TextEditingController();

  final emailTextFocusNode = FocusNode();
  final passwordTextFocusNode = FocusNode();
  final btnTextFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        if (message != null) {
          if (message.data['content_id'] != null) {
           // Get.toNamed(Routes.postScreen, arguments: message.data['content_id']);
          }
        }
      },
    );

    // 2. This method only call when App in foreground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification?.title??'');
          print(message.notification?.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createAndDisplayNotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print('notify ${message.data}');
        if (message.data['content_id'] != null) {
         // Get.toNamed(Routes.postScreen, arguments: message.data['content_id']);
        } else if (message.data['type'] == 'quiz'){
         // Get.toNamed(Routes.playScreen,);
        }
      },
    );
    super.onInit();
  }

  //login api call for user.
  loginApiCall(String email, String password) async {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextEditController.text.trim().toLowerCase(),
          password: passwordTextEditController.text.trim(),
        );
        print('check == ${userCredential}');
        Functions.toastMsg('Logged in successfully');
        emailTextEditController.text = '';
        passwordTextEditController.text = '';
      } on FirebaseAuthException catch (e) {
        Functions.toastMsg('Please enter the correct password');
      }
  }
}