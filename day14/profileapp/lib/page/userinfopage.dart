import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:profileapp/model/profile.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage(
      {super.key, required this.profile, required this.profileImg});

  final Profile profile;
  final String profileImg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(child: Text(profile.name)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                child: Image.network(
                  profileImg,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 170,
                left: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CircleAvatar(
                    radius: 30,
                    child: Image.network(
                      profileImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                const Text(
                  "Information",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(profile.email),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(profile.phone.split(' ')[0]),
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(
                      '${profile.address.city},${profile.address.street},${profile.address.suite}'),
                ),
                const Divider(),
                const Text(
                  "Company",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(profile.company.bs),
                      Text(profile.company.catchPhrase),
                      Text(profile.company.name),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
