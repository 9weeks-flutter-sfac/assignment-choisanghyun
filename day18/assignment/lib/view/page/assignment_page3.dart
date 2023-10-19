import 'package:assignment/controller/assignment3_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Assignment3Page extends GetView<Assignment3Controller> {
  const Assignment3Page({super.key});
  @override
  Widget build(BuildContext context) {
    _handleLogin(String emailLink) async {
      var acs = ActionCodeSettings(
          // URL you want to redirect back to. The domain (www.example.com) for this
          // URL must be whitelisted in the Firebase Console.
          url: 'https://domaincreated.page.link/6SuK',
          // This must be true
          handleCodeInApp: true,
          iOSBundleId: 'com.example.ios',
          androidPackageName: 'com.example.assignment',
          // installIfNotAvailable
          androidInstallApp: true,
          // minimumVersion
          androidMinimumVersion: '12');

      var emailAuth = emailLink;
      await FirebaseAuth.instance
          .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
          .catchError(
              (onError) => print('Error sending email verification $onError'))
          .then((value) {
        controller.isVerified(true);
        print('Successfully sent email verification');
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('chltkdgus1@sniperfactory.com'),
              TextButton(
                  onPressed: () => _handleLogin('chltkdgus1@sniperfactory.com'),
                  child: Obx(
                    () => Text(
                      controller.isVerified.value
                          ? '인증된 사용자 입니다.'
                          : '인증되지 않은 사용자입니다. 이곳을 클릭하여 인증을 받으세요.',
                      style: TextStyle(
                          color: controller.isVerified.value
                              ? Colors.green
                              : Colors.red),
                    ),
                  )),
            ]),
      ),
    );
  }
}
