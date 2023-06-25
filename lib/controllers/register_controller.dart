import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notifire/utilities/functions.dart';

class RegisterController extends GetxController {
  var nameTextEditController = TextEditingController();
  var emailTextEditController = TextEditingController();
  var passwordTextEditController = TextEditingController();
  final nameTextFocusNode = FocusNode();
  final emailTextFocusNode = FocusNode();
  final passwordTextFocusNode = FocusNode();
  final btnTextFocusNode = FocusNode();
  RxBool registering = false.obs;
  final formKey = GlobalKey<FormState>();




  Future<void> registerUser() async {
      registering.value = true;


    try {
      final String name = nameTextEditController.text.trim();
      final String email = emailTextEditController.text.trim();
      final String password = passwordTextEditController.text.trim();

      // Create the user in Firebase Authentication
      UserCredential userCredential =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.toLowerCase(),
        password: password,
      );

      // Update the user's display name
      await userCredential.user?.updateDisplayName(name);

      // Show success message
      Functions.toastMsg("User registered successfully");
      nameTextEditController.text = '';
      emailTextEditController.text = '';
      passwordTextEditController.text = '';
      
    } catch (e) {
      // Show error message

      Functions.toastMsg("Failed to register user: $e");

    }

      registering.value = false;
  }

}


