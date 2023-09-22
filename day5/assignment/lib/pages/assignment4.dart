import 'package:flutter/material.dart';

class Assignment4 extends StatefulWidget {
  const Assignment4({super.key});

  @override
  State<Assignment4> createState() => _Assignment4State();
}

class _Assignment4State extends State<Assignment4> {
  bool isClickedSun = false;
  bool isClickedMoon = false;
  bool isClickedStar = false;

  void typedPattern(String value) {
    if (value == '태양') {
      isClickedSun = !isClickedSun;
    } else if (value == '달') {
      isClickedMoon = !isClickedMoon;
    } else if (value == '별') {
      isClickedStar = !isClickedStar;
    } else {}
  }

  var txfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5일차 과제(3)'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.sunny,
                  color: isClickedSun ? Colors.red : Colors.black,
                ),
                const Text(
                  'Sun',
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isClickedSun = !isClickedSun;
                    });
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.nightlight_round,
                  color: isClickedMoon ? Colors.yellow : Colors.black,
                ),
                const Text('Moon'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isClickedMoon = !isClickedMoon;
                    });
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.star,
                  color: isClickedStar ? Colors.yellow : Colors.black,
                ),
                const Text('Star'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isClickedStar = !isClickedStar;
                    });
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                ),
              ],
            ),
          ),
          TextField(
            controller: txfController,
            onSubmitted: (value) {
              txfController.text = value;
              typedPattern(txfController.text);
              setState(() {});
            },
            decoration: const InputDecoration(
                hintText: '키고 끄고싶은 아이콘을 입력하세요.',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.5),
                    ),
                    borderSide: BorderSide(color: Colors.black))),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isClickedSun = false;
          isClickedMoon = false;
          isClickedStar = false;
          txfController.text = '';
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
