import 'package:get/get.dart';

class AppSettingController extends GetxController {
  bool isSoundOn = false;
  bool isNotificationOn = false;
  String appVersion = '1.0.0';
  String appName = 'TestApp';
  String appAuthor = 'Cocoadrinker';
  String appPackageName = 'AndroidPackage';
  DateTime? lastUpdated = DateTime.now();
}
