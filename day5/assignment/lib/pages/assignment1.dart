import 'package:assignment/pages/assignment2.dart';
import 'package:assignment/pages/assignment3.dart';
import 'package:assignment/pages/assignment4.dart';
import 'package:flutter/material.dart';

class Assignment1 extends StatelessWidget {
  const Assignment1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5일차 과제'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => const Assignment2(),
                      ));
                },
                child: const Text('1번 과제'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => const Assignment3(),
                      ));
                },
                child: const Text('2번 과제'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => const Assignment4(),
                      ));
                },
                child: const Text('3번 과제'),
              ),
            ]),
      ),
    );
  }
}
