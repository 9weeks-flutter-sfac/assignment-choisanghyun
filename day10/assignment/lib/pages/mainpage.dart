import 'package:assignment/pages/authorpage.dart';
import 'package:assignment/pages/secretpage.dart';
import 'package:assignment/pages/uploadpage.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Secret>? secretData;
  List<Author>? authorData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 180, 128, 190),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: Future.wait(
                [SecretCatApi.fetchSecrets(), SecretCatApi.fetchAuthors()]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                secretData = List<Secret>.from(snapshot.data![0].toList());
                authorData = List<Author>.from(snapshot.data![1].toList());
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SecretPage(secretData: secretData),
                          ),
                        ).then((value) => print('push then secret'));
                        //push 후 되돌아올때, then 이후의 코드가 실행됨.
                      },
                      child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: ListTile(
                            title: const Text(
                              '비밀보기',
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: const Text(
                              '놀러가기',
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Image.asset('assets/images/silence.png'),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthorPage(
                              authorData: authorData,
                            ),
                          ),
                        );
                      },
                      child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: ListTile(
                            title: const Text(
                              '작성자들 보기',
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: const Text(
                              '놀러가기',
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Image.asset('assets/images/silence.png'),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UploadPage(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: ListTile(
                            title: const Text(
                              '비밀 업로드',
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: const Text(
                              '놀러가기',
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Image.asset('assets/images/silence.png'),
                          )),
                    )
                  ],
                );
              } else {
                return const LinearProgressIndicator();
              }
            }),
      )),
    );
  }
}
