import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextFieldWidget extends StatelessWidget {
  const LoginTextFieldWidget({
    super.key,
    required this.controller,
    required this.item,
  });

  final TextEditingController controller;
  final String item;

  isObscureText(String value) {
    switch (value) {
      case 'PW':
        {
          return true;
        }
      default:
        {
          return false;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item),
        SizedBox(
          width: Get.width * 0.8,
          child: TextField(
            obscureText: isObscureText(item),
            controller: controller,
            decoration: InputDecoration(
                hintText: item,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
          ),
        )
      ],
    );
  }
}
