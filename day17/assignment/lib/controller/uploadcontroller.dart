import 'package:assignment/controller/authmanagecontroller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadContorller extends GetxController {
  var uploadController = TextEditingController();
  final Dio _dio = Dio();
  var user = Get.find<AuthManagementController>().user;

  upload(String secret, String? author, String? authorName) async {
    try {
      var res = await _dio.post(
          'http://52.79.115.43:8090/api/collections/secrets/records',
          data: {
            'secret': secret,
            'author': author ?? '',
            'authorName': authorName ?? '',
          });
      if (res.statusCode == 200) {
        uploadController.text = '';
      }
    } catch (e) {}
  }
}
