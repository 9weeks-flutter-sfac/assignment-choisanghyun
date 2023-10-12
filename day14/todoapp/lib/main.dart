import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widget/filter_bottom_sheet.dart';
import 'package:todoapp/widget/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var todoList;
  TodoFilter todoFilter = TodoFilter.all;
  Future<List<Todo>> readData() async {
    Dio dio = Dio();

    var res = await dio.get('https://jsonplaceholder.typicode.com/todos');
    if (res.statusCode == 200) {
      var todoList = List<Map<String, dynamic>>.from(res.data);
      return todoList.map((e) => Todo.fromMap(e)).toList();
    }
    return [];
  }

  List<Todo> filterMaker(List<Todo> todoData) {
    switch (todoFilter) {
      case TodoFilter.all:
        return todoData;
      case TodoFilter.completed:
        return todoData.where((element) => element.completed == true).toList();
      case TodoFilter.incompleted:
        return todoData.where((element) => element.completed == false).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Builder(builder: (context) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 3.0, sigmaY: 3.0), // 낮은 blur 강도로 설정
                  child: Container(color: Colors.black.withOpacity(0)),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "Todo App",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return FilterBottomSheet(
                          filter: todoFilter,
                          onApply: (p0) {
                            setState(() {
                              todoFilter = p0;
                            });
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.filter_list_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    todoList = await readData();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: readData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        todoList = snapshot.data;
                        return ListView.builder(
                          itemCount: filterMaker(todoList).length,
                          itemBuilder: (context, index) {
                            return TodoCard(
                              todo: filterMaker(todoList)[index],
                              key: UniqueKey(),
                            );
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
