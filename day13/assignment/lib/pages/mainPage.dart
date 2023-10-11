import 'package:assignment/models/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final Dio _dio = Dio();
  List<dynamic> postList = [];

  Future<dynamic> getPostData() async {
    var res = await _dio.get('https://jsonplaceholder.typicode.com/posts');

    postList = res.data.map((e) => Post.fromMap(e)).toList();

    return postList;
    //print(postList[0].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getPostData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  if (index % 5 == 4) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pages ${index - 3} ~ ${index + 1}",
                        style: const TextStyle(fontSize: 35),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Post postData = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            postData.title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(postData.body),
                                        ]),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black),
                                child: Center(child: Text('${postData.id}'))),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    postData.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(postData.body),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
