import 'package:assignment/controller/authmanagecontroller.dart';
import 'package:assignment/controller/authorcontroller.dart';
import 'package:assignment/controller/logincontroller.dart';
import 'package:assignment/controller/maincontroller.dart';
import 'package:assignment/controller/secretcontroller.dart';
import 'package:assignment/controller/signupcontroller.dart';
import 'package:assignment/controller/uploadcontroller.dart';
import 'package:assignment/view/pages/authorpage.dart';
import 'package:assignment/view/pages/loginpage.dart';
import 'package:assignment/view/pages/mainpage.dart';
import 'package:assignment/view/pages/secretpage.dart';
import 'package:assignment/view/pages/signuppage.dart';
import 'package:assignment/view/pages/uploadpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => AuthorController(), fenix: true);
        Get.put(AuthManagementController());
        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => SecretController(), fenix: true);
        Get.lazyPut(() => UploadContorller(), fenix: true);
        Get.lazyPut(() => MainController(), fenix: true);
        Get.lazyPut(() => SignUpContorller(), fenix: true);
      }),
      getPages: [
        GetPage(name: UploadPage.routes, page: () => const UploadPage()),
        GetPage(name: AuthorPage.routes, page: () => const AuthorPage()),
        GetPage(name: SecretPage.routes, page: () => const SecretPage()),
        GetPage(name: SignUpPage.routes, page: () => const SignUpPage()),
        GetPage(name: MainPage.routes, page: () => const MainPage()),
        GetPage(name: LoginPage.routes, page: () => const LoginPage()),
      ],
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Jalnan'),
      home: const LoginPage(),
    );
  }
}
