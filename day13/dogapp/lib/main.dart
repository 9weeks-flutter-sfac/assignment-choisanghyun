import 'package:dio/dio.dart';
import 'package:dogapp/models/dog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<dynamic> getDogUrl() async {
    final Dio dio = Dio();
    var res = await dio.get('https://dog.ceo/api/breeds/image/random');
    Dog dog = Dog.fromMap(res.data);
    return dog;
  }

  @override
  Widget build(BuildContext context) {
    getDogUrl();
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: 200,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: getDogUrl(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Dog dogData = snapshot.data!;
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: Image.network(
                              dogData.message,
                              fit: BoxFit.cover,
                            ),
                            actions: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('Close')),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Image.network(
                        dogData.message,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
