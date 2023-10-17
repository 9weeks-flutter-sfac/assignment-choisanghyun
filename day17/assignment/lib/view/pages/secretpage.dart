import 'dart:ui';
import 'package:assignment/controller/secretcontroller.dart';
import 'package:assignment/widgets/secretcardwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretPage extends GetView<SecretController> {
  const SecretPage({super.key});
  static const String routes = '/secret';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/secretbackgroundImg.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('뒤로가기'),
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            body: Obx(
              () => controller.secret.value != null
                  ? PageView.builder(
                      itemCount: controller.secret.value!.items.length,
                      itemBuilder: (context, index) {
                        return SecretCardWidget(
                            controller: controller, index: index);
                      })
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ],
    );
  }
}
