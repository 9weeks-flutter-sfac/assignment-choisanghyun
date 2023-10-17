import 'dart:ui';
import 'package:assignment/controller/authorcontroller.dart';
import 'package:assignment/widgets/authorwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorPage extends GetView<AuthorController> {
  const AuthorPage({super.key});
  static const String routes = '/author';

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
              () => controller.author.value != null
                  ? GridView.builder(
                      itemCount: controller.author.value!.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return AuthorWidget(
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
