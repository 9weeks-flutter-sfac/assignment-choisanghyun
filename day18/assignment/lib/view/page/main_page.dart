import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Get.toNamed('/assignment'),
                  child: const Text('Assignment 1'),
                ),
                TextButton(
                  onPressed: () => Get.toNamed('/assignment2'),
                  child: const Text('Assignment 2'),
                ),
                TextButton(
                  onPressed: () => Get.toNamed('/assignment3'),
                  child: const Text('Assignment 3'),
                ),
              ]),
        ),
      ),
    );
  }
}
