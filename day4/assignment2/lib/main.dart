import 'package:assignment2/orderItem.dart';
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
                    child: const OrderItem(
                        foodImg: 'assets/option_beer.png', foodName: '맥주'),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('떡볶이');
                    },
                    child: const OrderItem(
                        foodImg: 'assets/option_bokki.png', foodName: '떡볶이'),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('김밥');
                    },
                    child: const OrderItem(
                        foodImg: 'assets/option_kimbap.png', foodName: '김밥'),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('오므라이스');
                    },
                    child: const OrderItem(
                        foodImg: 'assets/option_omurice.png',
                        foodName: '오므라이스'),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('돈까스');
                    },
                    child: const OrderItem(
                        foodImg: 'assets/option_pork_cutlets.png',
                        foodName: '돈까스'),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('라면');
                    },
                    child: const OrderItem(
                        foodImg: 'assets/option_ramen.png', foodName: '라면'),
                  ),
                  InkWell(
                    onTap: () {
                      addOrderList('우동');
                    },
                    child: const OrderItem(
                        foodImg: 'assets/option_udon.png', foodName: '우동'),
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
