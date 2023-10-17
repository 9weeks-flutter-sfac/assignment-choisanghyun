import 'package:assignment/controller/authmanagecontroller.dart';
import 'package:assignment/controller/secretcontroller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

  login() {
    Get.find<AuthManagementController>()
        .login(idController.text, pwController.text);
  }

  readSecret() {
    Get.find<SecretController>().readSecret();
  }
}
