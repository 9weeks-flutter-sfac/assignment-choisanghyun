import 'package:assignment/controller/authmanagecontroller.dart';
import 'package:assignment/controller/authorcontroller.dart';
import 'package:assignment/controller/logincontroller.dart';
import 'package:assignment/controller/maincontroller.dart';
import 'package:assignment/controller/secretcontroller.dart';
import 'package:assignment/controller/signupcontroller.dart';
import 'package:assignment/controller/uploadcontroller.dart';
import 'package:get/get.dart';

class ControllerUtil {
  static void ControllerCollection() {
    Get.lazyPut(() => AuthorController(), fenix: true);
    Get.put(AuthManagementController());
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SecretController(), fenix: true);
    Get.lazyPut(() => UploadContorller(), fenix: true);
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => SignUpContorller(), fenix: true);
  }
}
