import 'package:assignment/pages/music_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:assignment/MusicTile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: const Color(0xFF121212),
        leading: const Icon(
          Icons.arrow_back_ios_rounded,
        ),
        title: const Text('아워리스트'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.airplay),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
        shape: const Border(
          bottom: BorderSide(
            color: Colors.white10,
            width: 1,
          ),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'Come with me',
                    subTitle: 'Surfaces 및 salem ilese',
                    imgUrl: 'music_come_with_me.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'Come with me',
              subTitle: 'Surfaces 및 salem ilese',
              musicTime: '3:00',
              imgUrl: 'music_come_with_me.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'Good day',
                    subTitle: 'Surfaces',
                    imgUrl: 'music_good_day.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'Good day',
              subTitle: 'Surfaces',
              musicTime: '3:00',
              imgUrl: 'music_good_day.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'Honesty',
                    subTitle: 'Pink Sweat\$',
                    imgUrl: 'music_honesty.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'Honesty',
              subTitle: 'Pink Sweat\$',
              musicTime: '3:09',
              imgUrl: 'music_honesty.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'I Wish I Missed My Ex',
                    subTitle: '마할리아 버크마',
                    imgUrl: 'music_i_wish_i_missed_my_ex.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'I Wish I Missed My Ex',
              subTitle: '마할리아 버크마',
              musicTime: '3:24',
              imgUrl: 'music_i_wish_i_missed_my_ex.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'Plastic Plants',
                    subTitle: '마할리아 버크마',
                    imgUrl: 'music_plastic_plants.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'Plastic Plants',
              subTitle: '마할리아 버크마',
              musicTime: '3:20',
              imgUrl: 'music_plastic_plants.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'Sucker for you',
                    subTitle: '맷 테리',
                    imgUrl: 'music_sucker_for_you.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'Sucker for you',
              subTitle: '맷 테리',
              musicTime: '3:24',
              imgUrl: 'music_sucker_for_you.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'Summer is for falling in love ',
                    subTitle:
                        'Sarah Kang & Eye Love BrandonSarah Kang & Eye Love Brandon',
                    imgUrl: 'music_summer_is_for_falling_in_love.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'Summer is for falling in love ',
              subTitle:
                  'Sarah Kang & Eye Love BrandonSarah Kang & Eye Love Brandon',
              musicTime: '3:00',
              imgUrl: 'music_summer_is_for_falling_in_love.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title:
                        'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
                    subTitle: 'Rudimental',
                    imgUrl: 'music_these_days.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
              subTitle: 'Rudimental',
              musicTime: '3:00',
              imgUrl: 'music_these_days.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'You Make Me',
                    subTitle: 'DAY6',
                    imgUrl: 'music_you_make_me.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'You Make Me',
              subTitle: 'DAY6',
              musicTime: '3:00',
              imgUrl: 'music_you_make_me.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MusicDetailPage(
                    title: 'Zombie Pop',
                    subTitle: 'DRP IAN',
                    imgUrl: 'music_zombie_pop.png',
                  ),
                ),
              );
            },
            child: const MusicTile(
              title: 'Zombie Pop',
              subTitle: 'DRP IAN',
              musicTime: '3:00',
              imgUrl: 'music_zombie_pop.png',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '둘러보기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_rounded),
            label: '보관함',
          ),
        ],
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64,
            color: const Color(0xFF2a2a2a),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(24), // Image radius
                      child: Image.asset('assets/music_you_make_me.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  const Flexible(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You Make Me',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color.fromARGB(255, 225, 225, 225),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'DAY6',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF989898),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.skip_next_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 1,
            child: Container(
              width: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
