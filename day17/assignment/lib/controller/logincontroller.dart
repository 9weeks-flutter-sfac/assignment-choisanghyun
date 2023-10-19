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

  String? textValidator({required String? value, required String item}) {
    switch (item) {
      case ('ID'):
        {
          if (value == "") {
            return 'ID를 입력해주세요.';
          }
        }
      case ('PW'):
        {
          if (value == "") {
            return 'PW를 입력해주세요.';
          } else if (value!.length < 9) {
            return 'PW 길이는 9자리 이상입니다.';
          }
        }
    }
    return null;
  }

  bool isObscureText(String value) {
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
}
