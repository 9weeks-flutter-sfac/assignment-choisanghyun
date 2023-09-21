import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  double xValue = 0;
  double yValue = 0;

  void _handleOnChangedX(String value) {
    xValue = double.parse(value);
  }

  void _handleOnChangedY(String value) {
    yValue = double.parse(value);
  }

  showResultDialog(
      BuildContext context, var operation, double xValue, double yValue) {
    double result;
    if (operation == '+') {
      result = xValue + yValue;
    } else if (operation == '-') {
      result = xValue - yValue;
    } else if (operation == '*') {
      result = xValue * yValue;
    } else if (operation == '/') {
      result = xValue / yValue;
    } else {
      result = 0;
    }

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
                child: Text(
              '$result',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("사칙 연산")),
        ),
        body: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('X의 값은?'),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 220,
                    child: TextField(
                      onChanged: _handleOnChangedX,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black12,
                          width: 1,
                        )),
                        hintText: 'x값을 입력하세요.',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('y의 값은?'),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 220,
                    child: TextField(
                      onChanged: _handleOnChangedY,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black12,
                          width: 1,
                        )),
                        hintText: 'y값을 입력하세요.',
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  showResultDialog(context, '+', xValue, yValue);
                },
                child: const Text('더하기의 결과 값은?'),
              ),
              ElevatedButton(
                onPressed: () {
                  showResultDialog(context, '*', xValue, yValue);
                },
                child: const Text('곱하기의 결과 값은?'),
              ),
              ElevatedButton(
                onPressed: () {
                  showResultDialog(context, '-', xValue, yValue);
                },
                child: const Text('빼기의 결과 값은?'),
              ),
              ElevatedButton(
                onPressed: () {
                  showResultDialog(context, '/', xValue, yValue);
                },
                child: const Text('나누기의 결과 값은?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
