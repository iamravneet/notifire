import 'package:flutter/material.dart';
import '../../../controllers/register_controller.dart';
import '../../../utilities/theme.dart';

class SignUpButton extends StatelessWidget {
  final RegisterController controller;

  const SignUpButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          if (controller.formKey.currentState!.validate()) {
            controller.registerUser();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              AppTheme.themeData.primaryColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: const Text(
          "Signup",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}