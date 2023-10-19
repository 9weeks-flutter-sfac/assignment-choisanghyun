import 'package:assignment/util/controller_util.dart';
import 'package:assignment/util/routes.dart';
import 'package:assignment/view/pages/loginpage.dart';
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
      initialBinding: BindingsBuilder(ControllerUtil.ControllerCollection),
      getPages: Routes.pages,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Jalnan'),
      home: const LoginPage(),
    );
  }
}
