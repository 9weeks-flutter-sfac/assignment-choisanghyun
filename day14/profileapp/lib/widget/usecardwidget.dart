// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:profileapp/model/profile.dart';
import 'package:profileapp/page/userinfopage.dart';

class userListTile extends StatelessWidget {
  const userListTile({
    super.key,
    required this.profile,
    required this.profileImg,
  });

  final Profile? profile;
  final String profileImg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return UserInfoPage(
              profile: profile!,
              profileImg: profileImg,
            );
          },
        ));
      },
      title: Text(profile!.name),
      subtitle: Text(profile!.email),
      leading: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Image.network(profileImg),
        ),
      ),
      trailing: const Icon(Icons.arrow_right_rounded),
    );
  }
}
