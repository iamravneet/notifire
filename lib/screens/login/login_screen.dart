import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifire/controllers/login_controller.dart';
import 'package:notifire/screens/login/widgets/signin_button.dart';
import 'package:notifire/screens/login/widgets/signup_link.dart';
import '../../utilities/validator.dart';
import '../registration/widgets/input_field.dart';
import '../registration/widgets/title_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 60, right: 20, left: 20, bottom: 20),
          child:  Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleSection(),
                const SizedBox(height: 20),
                InputField(
                  controller: controller.emailTextEditController,
                  hintText: 'Email',
                  focusNode: controller.emailTextFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.validateEmail,
                  nextFocusNode: controller.passwordTextFocusNode,
                ),
                const SizedBox(height: 20),
                InputField(
                  controller: controller.passwordTextEditController,
                  hintText: 'Password',
                  focusNode: controller.passwordTextFocusNode,
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validator.validatePassword,
                  nextFocusNode: controller.btnTextFocusNode,
                ),
                const SizedBox(height: 20),
                SignInButton(controller: controller),
                const SizedBox(height: 20),
                const SignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

