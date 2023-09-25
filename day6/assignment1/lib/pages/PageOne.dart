import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key, required this.mathData});

  final List<int> mathData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: mathData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ]),
            width: 20,
            height: 20,
            child: Center(child: Text(mathData[index].toString())),
          ),
        ),
      ),
    );
  }
}
