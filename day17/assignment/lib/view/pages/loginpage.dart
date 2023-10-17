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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTextFieldWidget(
                    controller: controller.idController, item: 'ID'),
                const SizedBox(
                  height: 20,
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
            ),
          ),
        ),
      ),
    );
  }
}
