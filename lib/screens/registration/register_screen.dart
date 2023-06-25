import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifire/controllers/register_controller.dart';
import 'package:notifire/screens/registration/widgets/input_field.dart';
import 'package:notifire/screens/registration/widgets/signin_link.dart';
import 'package:notifire/screens/registration/widgets/signup_button.dart';
import 'package:notifire/screens/registration/widgets/title_section.dart';
import '../../utilities/validator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleSection(),
                const SizedBox(height: 20),
                InputField(
                  controller: controller.nameTextEditController,
                  hintText: 'Name',
                  focusNode: controller.nameTextFocusNode,
                  keyboardType: TextInputType.name,
                  validator: Validator.validateName,
                  nextFocusNode: controller.emailTextFocusNode,
                ),
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
                SignUpButton(controller: controller),
                const SizedBox(height: 20),
                const SignInLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







