import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:profileapp/model/profile.dart';
import 'package:profileapp/widget/usecardwidget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dio dio = Dio();
  List<Profile>? profileList = [];
  String profileImg = 'https://xsgames.co/randomusers/assets/avatars/male/';
  Future<List<Profile>> readData() async {
    var res = await dio.get('https://jsonplaceholder.typicode.com/users');
    if (res.statusCode == 200) {
      var profiles = List<Map<String, dynamic>>.from(res.data);

      var data = profiles.map((e) => Profile.fromMap(e)).toList();
      return data;
    }
    return [];
  }

  void reloadData() async {
    profileList = await readData();
    setState(() {
      // 상태 변경 후 setState 호출하여 화면 갱신
      // 데이터 다시 로딩
    });
  }

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: GestureDetector(
              onTap: () {
                reloadData();
              },
              child: const Text(
                "My Contacts",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        body: Container(
          child: FutureBuilder(
            future: readData(),
            builder: (context, snapshot) {
              profileList = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: profileList!.length,
                  itemBuilder: (context, index) {
                    return FadeInRight(
                      duration: Duration(milliseconds: 1000 * index),
                      child: userListTile(
                          profile: profileList![index],
                          profileImg: '$profileImg$index.jpg'),
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
        ));
  }
}
