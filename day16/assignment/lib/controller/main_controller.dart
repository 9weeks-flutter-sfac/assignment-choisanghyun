import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/model/document.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt curPage = 0.obs;
  final Rxn<List<Item>> _doc = Rxn<List<Item>>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readDocument();
  }

  List<Item>? get doc => _doc.value;

  final Dio _dio = Dio();
  onPageTapped(int v) {
    pageController.jumpToPage(v);
    curPage(v);
  }

  readDocument() async {
    if (Get.find<AuthController>().token != null) {
      _dio.options.headers["authorization"] = Get.find<AuthController>().token;
      try {
        var res = await _dio
            .get('http://52.79.115.43:8090/api/collections/documents/records');
        if (res.statusCode == 200) {
          var data = Document.fromMap(res.data);
          _doc(data.items);
        }
      } catch (e) {}
    }
  }

  logout() {
    Get.find<AuthController>().logout();
    curPage(0);
  }
}
