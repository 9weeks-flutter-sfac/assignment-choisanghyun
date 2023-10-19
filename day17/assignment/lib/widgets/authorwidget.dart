import 'package:animate_do/animate_do.dart';
import 'package:assignment/controller/authorcontroller.dart';
import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final AuthorController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
          from: 50,
          duration: const Duration(milliseconds: 1500),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ClipOval(
                child: Image.network(
                  controller.author.value!.items[index].avatar!,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Center(
                        child: Text(
                            controller.author.value!.items[index].username!));
                  },
                ),
              ),
            ),
          ),
        ),
        ZoomIn(
            duration: const Duration(seconds: 1),
            child: Text(controller.author.value!.items[index].username!)),
      ],
    );
  }
}
