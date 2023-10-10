import 'package:assignment/model/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Dio _dio = Dio();
  var f = NumberFormat.currency(locale: "ko_KR", symbol: "");
  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> getRes() async {
    var res = await _dio.get('https://sniperfactory.com/sfac/http_json_data');
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: FutureBuilder(
              future: getRes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var res = Post.fromJson(snapshot.data!.data["item"]);
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            offset: const Offset(0, 7),
                          )
                        ]),
                    height: 400,
                    width: 250,
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                              child: Image.network(res.imageUrl,
                                  fit: BoxFit.fill)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  res.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                Text(res.description),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child:
                                        Text('${f.format(res.price)}원 결제하고 등록'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
