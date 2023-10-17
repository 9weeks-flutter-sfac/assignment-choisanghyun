import 'package:animate_do/animate_do.dart';
import 'package:assignment/controller/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpTextFieldWidget extends StatelessWidget {
  const SignUpTextFieldWidget(
      {super.key,
      required this.controller,
      required this.item,
      this.isVisible});

  final TextEditingController controller;
  final String item;
  final bool? isVisible;

  @override
  Widget build(BuildContext context) {
    var signUpController = Get.find<SignUpContorller>();
    return isVisible == true
        ? FadeInUp(
            from: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item),
                SizedBox(
                  width: Get.width * 0.8,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return signUpController.textValidator(
                          value: value, item: item);
                    },
                    obscureText: signUpController.isObscureText(item),
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: item,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                )
              ],
            ),
          )
        : const SizedBox();
  }
}
