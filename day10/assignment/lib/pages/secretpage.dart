import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

class SecretPage extends StatelessWidget {
  const SecretPage({super.key, required this.secretData});
  final List<Secret>? secretData;
  @override
  Widget build(BuildContext context) {
    List<Secret>? data = secretData;
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
            body: PageView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
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
                              data[index].secret,
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                          data[index].author != null
                              ? Text(data[index].author!.username)
                              : const Text('익명')
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
