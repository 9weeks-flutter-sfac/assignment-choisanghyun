import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> orderList = [];

  void addOrderList(String orderItem) {
    setState(() {
      orderList.add(orderItem);
    });
  }

  void _hadleResetOrderList() {
    setState(() {
      orderList = [];
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              '분식왕 이테디 주문하기',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '주문 리스트',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              child: Text('$orderList'),
            ),
            const Text(
              '음식',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              flex: 5,
              child: GridView.count(
                padding: const EdgeInsets.all(5.0),
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 10.0,
                crossAxisCount: 3,
                children: [
                  InkWell(
                    onTap: () {
                      addOrderList('맥주');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Image.asset('assets/option_beer.png',
                                  fit: BoxFit.cover)),
                          const Text(
                            '맥주',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("[담기]"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('떡볶이');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Image.asset('assets/option_bokki.png',
                                  fit: BoxFit.cover)),
                          const Text(
                            '떡볶이',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("[담기]"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('김밥');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Image.asset('assets/option_kimbap.png',
                                  fit: BoxFit.cover)),
                          const Text(
                            '김밥',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("[담기]"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('오므라이스');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Image.asset('assets/option_omurice.png',
                                  fit: BoxFit.cover)),
                          const Text(
                            '오므라이스',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("[담기]"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('돈까스');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Image.asset(
                                  'assets/option_pork_cutlets.png',
                                  fit: BoxFit.cover)),
                          const Text(
                            '돈까스',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("[담기]"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('라면');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Image.asset('assets/option_ramen.png',
                                  fit: BoxFit.cover)),
                          const Text(
                            '라면',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("[담기]"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('우동');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Image.asset('assets/option_udon.png',
                                  fit: BoxFit.cover)),
                          const Text(
                            '우동',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("[담기]"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _hadleResetOrderList,
          label: const Text('초기화 하기'),
        ),
      ),
    );
  }
}
