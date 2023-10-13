import 'package:assignment/controller/coin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CoinController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("상점"),
            Obx(() => Text('현재 보유한 코인 : ${controller.coinCount}')),
            ElevatedButton(
              onPressed: () {
                controller.coinCount(0);
                //controller.coinTimer.cancel();
              },
              child: const Text('코인 리셋'),
            ),
          ],
        ),
      ),
    );
  }
}
