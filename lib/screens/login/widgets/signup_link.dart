import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utilities/routes.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Get.offNamed(Routes.registerScreen);
        },
        child: const Text(
          'Signup',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black87,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}