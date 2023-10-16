import 'package:assignment/model/user.dart';
import 'package:assignment/util/api_routes.dart';
import 'package:assignment/view/page/login_page.dart';
import 'package:assignment/view/page/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final Rx<String> _token = Rx('');
  Dio dio = Dio();
  login(String id, String pw) async {
    try {
      var res = await dio
          .post('http://52.79.115.43:8090/${ApiRoutes.authWithPassord}', data: {
        'identity': id,
        'password': pw,
      });
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        var token = res.data['token'];
        _user(user);
        _token(token);
      }
    } catch (e) {}
  }

  User? get user => _user.value;
  String? get token => _token.value;
  logout() {
    _user.value = null;
    _user(null);
  }

  _handleAuthChanged(User? data) {
    if (data != null) {
      Get.toNamed(MainPage.route);
      return;
    }
    Get.toNamed(LoginPage.route);
    return;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
