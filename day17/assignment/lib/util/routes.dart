import 'package:assignment/view/pages/authorpage.dart';
import 'package:assignment/view/pages/loginpage.dart';
import 'package:assignment/view/pages/mainpage.dart';
import 'package:assignment/view/pages/secretpage.dart';
import 'package:assignment/view/pages/signuppage.dart';
import 'package:assignment/view/pages/uploadpage.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage<dynamic>> pages = [
    GetPage(name: UploadPage.routes, page: () => const UploadPage()),
    GetPage(name: AuthorPage.routes, page: () => const AuthorPage()),
    GetPage(name: SecretPage.routes, page: () => const SecretPage()),
    GetPage(name: SignUpPage.routes, page: () => const SignUpPage()),
    GetPage(name: MainPage.routes, page: () => const MainPage()),
    GetPage(name: LoginPage.routes, page: () => const LoginPage()),
  ];
}
