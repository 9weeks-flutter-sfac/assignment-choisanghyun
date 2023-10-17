import 'package:assignment/controller/signupcontroller.dart';
import 'package:assignment/model/user.dart';
import 'package:assignment/view/pages/loginpage.dart';
import 'package:assignment/view/pages/mainpage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData;

class AuthManagementController extends GetxController {
  final Rxn<User> _user = Rxn();
  final Rx<String> _token = Rx('');
  final Dio _dio = Dio();

  User? get user => _user.value;
  String? get token => _token.value;

  login(String id, String pw) async {
    try {
      var res = await _dio.post(
          'http://52.79.115.43:8090/api/collections/users/auth-with-password',
          data: {
            'identity': id,
            'password': pw,
          });
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        var token = res.data['token'];
        _user(user);
        _token(token);
      }
    } catch (e) {
      print(e);
    }
  }

  logout() {
    _user.value = null;
    _user(null);
  }

  signup(String email, String pw, String pwConfirm, String? userName) async {
    try {
      var res = await _dio.post(
          'http://52.79.115.43:8090/api/collections/users/records',
          data: FormData.fromMap({
            'email': email,
            'password': pw,
            'passwordConfirm': pwConfirm,
            'username': userName,
          }));

      if (res.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "아이디 생성 성공",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
        Get.find<SignUpContorller>().emailContorller.text = '';
        Get.find<SignUpContorller>().pwContorller.text = '';
        Get.find<SignUpContorller>().pwConfirmContorller.text = '';
        Get.find<SignUpContorller>().userNameContorller.text = '';
        Get.find<SignUpContorller>().isEmail(false);
        Get.find<SignUpContorller>().isPW(false);
        Get.find<SignUpContorller>().isPWConfirm(false);
        Get.toNamed(LoginPage.routes);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "아이디 생성 실패",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.yellow,
          fontSize: 16.0);
      print(e);
    }
  }

  _handleAuthChanged(User? data) {
    if (data != null) {
      Get.toNamed(MainPage.routes);
      return;
    }

    Get.offAndToNamed(LoginPage.routes);

    return;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
