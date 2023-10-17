import 'package:assignment/model/author.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthorController extends GetxController {
  Rxn<Author> author = Rxn();
  final Dio _dio = Dio();

  readAuthor() async {
    try {
      var res = await _dio.get(
          'http://52.79.115.43:8090/api/collections/users/records?sort=-created');
      if (res.statusCode == 200) {
        var data = Author.fromMap(res.data);
        author(data);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readAuthor();
  }
}
