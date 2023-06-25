import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? nextFocusNode;

  const InputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.focusNode,
    required this.keyboardType,
    this.validator,
    this.nextFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        border: Border.all(color: const Color(0xffcccccc), width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 18,
            color: Color(0xffcccccc),
          ),
        ),
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'RobotoRegular',
          color: Color(0xff797979),
        ),
        keyboardType: keyboardType,
        focusNode: focusNode,
        onFieldSubmitted: (_) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        validator: validator,
      ),
    );
  }
}