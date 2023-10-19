import 'package:assignment/controller/signupcontroller.dart';
import 'package:assignment/widgets/signuptextfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpContorller> {
  const SignUpPage({super.key});
  static const String routes = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('회원가입')),
        backgroundColor: const Color.fromARGB(255, 180, 128, 190),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromARGB(255, 180, 128, 190),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(children: [
                SignUpTextFieldWidget(
                  controller: controller.emailContorller,
                  item: 'Email*',
                  isVisible: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => SignUpTextFieldWidget(
                      controller: controller.pwContorller,
                      item: 'PW*',
                      isVisible: controller.emailVisible.value),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => SignUpTextFieldWidget(
                    controller: controller.pwConfirmContorller,
                    item: 'PW확인*',
                    isVisible: controller.pwVisible.value)),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => SignUpTextFieldWidget(
                      controller: controller.userNameContorller,
                      item: '별명',
                      isVisible: controller.pwConfirmVisible.value,
                    )),
                const SizedBox(
                  height: 20,
                ),
              ]),
              SizedBox(
                height: Get.height * 0.35,
              ),
              Obx(() => controller.pwConfirmVisible.value == true
                  ? SizedBox(
                      width: Get.width * 0.95,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF6EC6CA), // Background color
                          ),
                          onPressed: controller.signup,
                          child: const Text('회원가입 하기')),
                    )
                  : const SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
