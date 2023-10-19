import 'dart:ffi';

import 'package:assignment/controller/logincontroller.dart';
import 'package:assignment/view/pages/signuppage.dart';
import 'package:assignment/widgets/logintextfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String routes = '/login';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 180, 128, 190),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Stack(
                  children: [
                    const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '끄적끄적',
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Text(
                          '비밀 노트',
                          style: TextStyle(fontSize: 70),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 20,
                      bottom: 50,
                      child: Hero(
                        tag: 'trademark',
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            'assets/images/silence.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LoginTextFieldWidget(
                    controller: controller.idController, item: 'ID'),
                const SizedBox(
                  height: 10,
                ),
                LoginTextFieldWidget(
                    controller: controller.pwController, item: 'PW'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF6EC6CA), // Background color
                      ),
                      onPressed: controller.login,
                      child: const Text('로그인')),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF6EC6CA), // Background color
                      ),
                      onPressed: () => Get.toNamed(SignUpPage.routes),
                      child: const Text('회원가입')),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
