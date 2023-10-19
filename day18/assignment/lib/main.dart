import 'package:assignment/controller/assignment2_controller.dart';
import 'package:assignment/controller/assignment3_controller.dart';
import 'package:assignment/controller/assignment_controller.dart';
import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:assignment/firebase_options.dart';
import 'package:assignment/view/page/assignment_page.dart';
import 'package:assignment/view/page/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/page/assignment_page3.dart';
import 'view/page/assignmnet_page2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Check if you received the link via `getInitialLink` first
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    // Example of using the dynamic link to push the user to a different screen
    Get.toNamed(deepLink.path);
  }

  FirebaseDynamicLinks.instance.onLink.listen(
    (pendingDynamicLinkData) {
      // Set up the `onLink` event listener next as it may be received here
      final Uri deepLink = pendingDynamicLinkData.link;
      // Example of using the dynamic link to push the user to a different screen
      Get.toNamed(deepLink.path);
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(MainController());
        Get.put(AuthController());
        Get.lazyPut(() => Assignment2Controller());
        Get.lazyPut(() => Assignment3Controller());
        Get.lazyPut(() => AssignmentController());
      }),
      getPages: [
        GetPage(name: '/assignment', page: () => const AssignmentPage()),
        GetPage(name: '/assignment2', page: () => const Assignment2Page()),
        GetPage(name: '/assignment3', page: () => const Assignment3Page()),
      ],
      home: const MainPage(),
    );
  }
}
