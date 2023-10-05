import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secret_cat_sdk/api/api.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    var textFieldController = TextEditingController();

    return Stack(children: <Widget>[
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      SecretCatApi.addSecret(textFieldController.text);
                      textFieldController.text = '';
                      setState(() {});
                    },
                    child: const Text("비밀 전송하기"),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: TextField(
                    controller: textFieldController,
                    maxLines: null,
                    expands: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
