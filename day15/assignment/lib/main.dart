import 'package:assignment/controller/app_setting_controller.dart';
import 'package:assignment/controller/coin_controller.dart';
import 'package:assignment/view/coin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoinController());
    Get.put(AppSettingController());
    return GetMaterialApp(
      home: CoinPage(),
    );
  }
}
