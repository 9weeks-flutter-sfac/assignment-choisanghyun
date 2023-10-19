import 'package:assignment/controller/authmanagecontroller.dart';
import 'package:assignment/controller/maincontroller.dart';
import 'package:assignment/widgets/menulisttilewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String routes = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthManagementController>().user;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 180, 128, 190),
            actions: [
              IconButton(
                  onPressed: controller.logout,
                  icon: const Icon(Icons.exit_to_app_rounded))
            ]),
        backgroundColor: const Color.fromARGB(255, 180, 128, 190),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text('${user!.username} 님 안녕하세요!'),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Hero(
                      tag: 'trademark',
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/silence.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.menuList.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          MenuListTile(
                              title: controller.menuList[index],
                              subtitle: '놀러가기',
                              route: controller.routeList[index],
                              imageUrl: 'assets/images/silence.png'),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
