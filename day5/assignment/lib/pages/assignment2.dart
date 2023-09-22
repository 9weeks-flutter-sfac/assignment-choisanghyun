import 'package:flutter/material.dart';

class Assignment2 extends StatelessWidget {
  const Assignment2({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];
    var srlController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('5일차 과제(1)'),
      ),
      body: ListView.builder(
        controller: srlController,
        itemCount: animalList.length,
        itemBuilder: (context, index) {
          return Center(
            child: SizedBox(
              height: 300,
              child: Center(
                child: Text(
                  animalList[index],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          srlController.animateTo(
            srlController.position.minScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        child: const Icon(Icons.vertical_align_top_outlined),
      ),
    );
  }
}
