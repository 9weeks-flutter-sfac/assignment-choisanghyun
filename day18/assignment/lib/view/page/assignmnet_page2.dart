import 'package:assignment/controller/assignment2_controller.dart';
import 'package:assignment/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Assignment2Page extends GetView<Assignment2Controller> {
  const Assignment2Page({super.key});

  _handleFacebookLogin() {
    Get.find<AuthController>().providerFacebook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: _handleFacebookLogin,
                  icon: const Icon(Icons.facebook))
            ]),
      ),
    );
  }
}
