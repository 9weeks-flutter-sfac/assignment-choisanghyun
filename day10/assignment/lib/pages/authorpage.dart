import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/model/author.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key, required this.authorData});
  final List<Author>? authorData;
  @override
  Widget build(BuildContext context) {
    List<Author>? data = authorData;

    return Stack(
      children: <Widget>[
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
            body: GridView.builder(
                itemCount: data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      BounceInUp(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: ClipOval(
                              child: Image.network(
                                data[index].avatar!,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Center(
                                      child: Text(data[index].username[0]));
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      ZoomIn(
                          duration: const Duration(seconds: 3),
                          child: Text(data[index].username)),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
