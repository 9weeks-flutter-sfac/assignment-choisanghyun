import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.readDocument,
        child: const Icon(Icons.refresh),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}님 안녕하세요.',
                  style: const TextStyle(fontSize: 32),
                ),
                Obx(() => controller.doc != null
                    ? SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: controller.doc!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.doc![index].title),
                                  Text(controller.doc![index].content),
                                  controller.doc![index].attachmentUrl != null
                                      ? Image.network(
                                          controller.doc![index].attachmentUrl!)
                                      : const SizedBox()
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox()),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(user.username),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: const Text('로그아웃 하기'),
                  leading: const Icon(Icons.logout),
                  onTap: controller.logout,
                ),
                Text(
                  '${user.name}님 안녕하세요.',
                  style: const TextStyle(fontSize: 32),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
