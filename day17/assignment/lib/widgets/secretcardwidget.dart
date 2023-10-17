import 'package:animate_do/animate_do.dart';
import 'package:assignment/controller/secretcontroller.dart';
import 'package:flutter/material.dart';

class SecretCardWidget extends StatelessWidget {
  const SecretCardWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final SecretController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              duration: const Duration(seconds: 3),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/silence.png',
                    ),
                  ),
                ),
              ),
            ),
            BounceInRight(
              child: Text(
                controller.secret.value!.items[index].secret,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Text(controller.secret.value!.items[index].authorName),
          ],
        ),
      ),
    );
  }
}
