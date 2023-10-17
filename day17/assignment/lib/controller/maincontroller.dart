import 'package:assignment/controller/authmanagecontroller.dart';
import 'package:assignment/controller/logincontroller.dart';
import 'package:assignment/view/pages/authorpage.dart';
import 'package:assignment/view/pages/secretpage.dart';
import 'package:assignment/view/pages/uploadpage.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  List<String> menuList = ['비밀 보기', '작성자들 보기', '비밀 업로드'];
  List<String> routeList = [
    SecretPage.routes,
    AuthorPage.routes,
    UploadPage.routes
  ];

  logout() {
    Get.find<AuthManagementController>().logout();
    Get.find<LoginController>().idController.text = '';
    Get.find<LoginController>().pwController.text = '';
  }
}
