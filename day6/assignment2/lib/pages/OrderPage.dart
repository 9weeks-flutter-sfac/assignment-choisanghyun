import 'package:assignment2/OrderItem.dart';
import 'package:assignment2/pages/AdminPage.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> orderList = [];
  bool isFABVisible = false;
  @override
  Widget build(BuildContext context) {
    void addOrderList(String orderItem) {
      setState(() {
        orderList.add(orderItem);
        if (orderList.isNotEmpty) isFABVisible = true;
      });
    }

    void handleOnDelete(String orderItem) {
      setState(() {
        orderList.remove(orderItem);
        if (orderList.isEmpty) isFABVisible = false;
      });
    }

    void handleOnDobleTapAppBar() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminPage(),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: GestureDetector(
            onDoubleTap: handleOnDobleTapAppBar,
            child: const Text(
              '분식왕 이테디 주문하기',
              style: TextStyle(color: Colors.black),
            ),
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
          SizedBox(
            height: 35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: orderList
                      .map(
                        (e) => Chip(
                          label: Text(e),
                          deleteIcon:
                              const Icon(Icons.highlight_remove_rounded),
                          onDeleted: () => handleOnDelete(e),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
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
                    foodImg: 'assets/option_beer.png',
                    foodName: '맥주',
                  ),
                ),
                InkWell(
                  onTap: () {
                    addOrderList('떡볶이');
                  },
                  child: const OrderItem(
                    foodImg: 'assets/option_bokki.png',
                    foodName: '떡볶이',
                  ),
                ),
                InkWell(
                  onTap: () {
                    addOrderList('김밥');
                  },
                  child: const OrderItem(
                    foodImg: 'assets/option_kimbap.png',
                    foodName: '김밥',
                  ),
                ),
                InkWell(
                  onTap: () {
                    addOrderList('오므라이스');
                  },
                  child: const OrderItem(
                    foodImg: 'assets/option_omurice.png',
                    foodName: '오므라이스',
                  ),
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
                    foodImg: 'assets/option_ramen.png',
                    foodName: '라면',
                  ),
                ),
                InkWell(
                  onTap: () {
                    addOrderList('우동');
                  },
                  child: const OrderItem(
                    foodImg: 'assets/option_udon.png',
                    foodName: '우동',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: isFABVisible,
        maintainAnimation: true,
        maintainState: true,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          opacity: isFABVisible ? 1 : 0,
          child: FloatingActionButton.extended(
            onPressed: () => (),
            label: const Text('결제하기'),
          ),
        ),
      ),
    );
  }
}
