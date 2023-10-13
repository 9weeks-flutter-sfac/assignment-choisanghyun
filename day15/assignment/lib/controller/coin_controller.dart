import 'dart:async';

import 'package:get/get.dart';

class CoinController extends GetxController {
  RxInt coinCount = RxInt(0);
  late Timer coinTimer;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    coinTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      coinCount++;
    });

    ever(coinCount, (coinValue) {
      if ((coinValue != 0) && (coinValue % 10 == 0)) {
        Get.snackbar('코인 $coinValue개 돌파!', '축하드립니다!');
      }
    });
    print('[GetX] Coin Controller 생성 완료');
  }
}
