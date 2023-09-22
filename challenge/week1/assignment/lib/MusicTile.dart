import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgUrl,
    required this.musicTime,
  });

  final String title;
  final String subTitle;
  final String musicTime;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(24), // Image radius
              child: Image.asset('assets/$imgUrl', fit: BoxFit.cover),
            ),
          ),
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 225, 225, 225),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          subTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF989898),
                          ),
                        ),
                      ),
                      Text(
                        ' - $musicTime',
                        style: const TextStyle(
                          color: Color(0xFF989898),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
