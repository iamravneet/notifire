import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utilities/routes.dart';

class SignInLink extends StatelessWidget {
  const SignInLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            Get.offNamed(Routes.loginScreen);
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}