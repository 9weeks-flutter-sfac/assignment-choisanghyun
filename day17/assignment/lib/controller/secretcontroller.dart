import 'package:assignment/model/secret.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SecretController extends GetxController {
  Rxn<Secret> secret = Rxn();
  final Dio _dio = Dio();

  readSecret() async {
    try {
      var res = await _dio.get(
          'http://52.79.115.43:8090/api/collections/secrets/records?sort=-created');
      if (res.statusCode == 200) {
        var data = Secret.fromMap(res.data);
        secret(data);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readSecret();
  }
}
