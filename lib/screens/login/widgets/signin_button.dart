import 'package:flutter/material.dart';
import 'package:notifire/utilities/theme.dart';
import '../../../controllers/login_controller.dart';

class SignInButton extends StatelessWidget {
  final LoginController controller;

  const SignInButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          if (controller.formKey.currentState!.validate()) {
            controller.loginApiCall(
              controller.emailTextEditController.text,
              controller.passwordTextEditController.text,
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            AppTheme.themeData.primaryColor
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: const Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }


}