import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(
                      text: '안녕하세요! 반갑습니다.\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: '저는 '),
                  const TextSpan(
                    text: '최상현',
                    style: TextStyle(color: Colors.blue),
                  ),
                  const TextSpan(text: '이라고 합니다.\n\n\n\n'),
                  const TextSpan(
                    text: '만나서 반갑습니다.\n',
                    style: TextStyle(fontSize: 30),
                  ),
                  const TextSpan(text: 'Flutter에 관심이 생겨 지원을 하게 되었으며,\n'),
                  TextSpan(
                    text: '경력있는 신입인건 비밀',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  TextSpan(
                    text: '훌륭한 멘토',
                    style: TextStyle(
                      color: Colors.green.shade400,
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                    ),
                  ),
                  const TextSpan(text: '님들을 만나게 되어 영광입니다.\n\n\n\n'),
                  const TextSpan(text: '앞으로 9주 동안 잘 부탁드립니다.\n'),
                  const TextSpan(
                    text: '감사합니다.\n',
                    style: TextStyle(
                      backgroundColor: Colors.amber,
                      color: Colors.deepPurple,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
