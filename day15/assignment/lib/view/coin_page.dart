import 'dart:async';

import 'package:assignment/controller/coin_controller.dart';
import 'package:assignment/view/first_page.dart';
import 'package:assignment/view/store_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CoinPage extends StatelessWidget {
  CoinPage({super.key});
  var controller = Get.find<CoinController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Current Coin : ${controller.coinCount}')),
            Icon(
              FontAwesomeIcons.bitcoin,
              size: 96.0,
              color: Colors.yellow.shade700,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const StorePage());
              },
              child: const Text('상점으로 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const FirstPage());
              },
              child: const Text('다음페이지로 이동(1)'),
            ),
          ],
        ),
      ),
    );
  }
}
