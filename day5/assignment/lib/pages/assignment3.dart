import 'package:flutter/material.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
  //Controller 생성시 build 안에 선언하면 setState시 계속 초기화 되므로
  //정상적으로 작동하지 않음, 그래서 build 밖에다 선언 후 진행
  //setState ==> build가 계속 재생성됨
  var txfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5일차 과제(2)'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: txfController,
            onChanged: (value) {
              setState(() {});
            },
          ),
          Text(
            txfController.text,
            style: const TextStyle(color: Colors.black),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          txfController.text = '';
          setState(() {});
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
