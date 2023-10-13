import 'package:assignment/controller/app_setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppSettingController>();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(controller.appAuthor),
          Text(controller.appName),
          Text(controller.appPackageName),
          Text(controller.appVersion),
          Text('${controller.isNotificationOn}'),
          Text('${controller.isSoundOn}'),
          Text('${controller.lastUpdated}'),
        ],
      ),
    ));
  }
}
