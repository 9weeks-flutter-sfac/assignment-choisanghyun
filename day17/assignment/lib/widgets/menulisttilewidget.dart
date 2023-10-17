import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.route,
  });

  final String title;
  final String subtitle;
  final String route;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route);
      },
      child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(color: Colors.black),
            ),
            trailing: Image.asset(imageUrl),
          )),
    );
  }
}
