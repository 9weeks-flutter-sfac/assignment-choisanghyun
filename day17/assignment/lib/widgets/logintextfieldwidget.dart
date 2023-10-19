import 'package:assignment/controller/logincontroller.dart';
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

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item),
        SizedBox(
          width: Get.width * 0.8,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return loginController.textValidator(value: value, item: item);
            },
            obscureText: loginController.isObscureText(item),
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
