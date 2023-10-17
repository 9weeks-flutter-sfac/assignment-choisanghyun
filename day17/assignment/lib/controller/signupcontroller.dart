import 'package:assignment/controller/authmanagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpContorller extends GetxController {
  var emailContorller = TextEditingController();
  var pwContorller = TextEditingController();
  var pwConfirmContorller = TextEditingController();
  var userNameContorller = TextEditingController();

  RxBool emailVisible = RxBool(false);
  RxBool pwVisible = RxBool(false);
  RxBool pwConfirmVisible = RxBool(false);
  signup() {
    Get.find<AuthManagementController>().signup(emailContorller.text,
        pwContorller.text, pwConfirmContorller.text, userNameContorller.text);
  }

  isEmail(bool value) async {
    await Future.delayed(Duration.zero);
    emailVisible(value);
  }

  isPW(bool value) async {
    await Future.delayed(Duration.zero);
    pwVisible(value);
  }

  isPWConfirm(bool value) async {
    await Future.delayed(Duration.zero);
    pwConfirmVisible(value);
  }

  bool isObscureText(String value) {
    switch (value) {
      case 'PW*':
      case 'PW확인*':
        {
          return true;
        }
      default:
        {
          return false;
        }
    }
  }

  String? textValidator({required String? value, required String item}) {
    switch (item) {
      case 'Email*':
        {
          if (!(value!.contains('@') && value.contains('.'))) {
            return '이메일 형식에 맞지 않습니다.';
          }
          isEmail(true);
          return null;
        }

      case 'PW*':
        {
          if (value!.length < 9) {
            return '비밀번호는 9자 이상 가능합니다.';
          }
          isPW(true);
          return null;
        }
      case 'PW확인*':
        {
          if (value != pwContorller.text) {
            return '비밀번호가 같지 않습니다.';
          }
          isPWConfirm(true);
          return null;
        }
    }
    return null;
  }
}
