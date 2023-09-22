import 'package:flutter/material.dart';

class MusicDetailPage extends StatefulWidget {
  const MusicDetailPage(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imgUrl});
  final String title;
  final String subTitle;
  final String imgUrl;

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  bool isClickedPlay = false;

  @override
  Widget build(BuildContext context) {
    const prevBtnSnakeBar = SnackBar(
      content: Text('이전버튼을 눌렀을 때 나오는 SnakeBar'),
    );
    const plyBtnSnakeBar = SnackBar(
      content: Text('Play버튼을 눌렀을 때 나오는 SnakeBar'),
    );
    const nxtBtnSnakeBar = SnackBar(
      content: Text('다음버튼을 눌렀을 때 나오는 SnakeBar'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(60), // Image radius
                child:
                    Image.asset('assets/${widget.imgUrl}', fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                widget.subTitle,
                style: const TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 166, 166, 166)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(prevBtnSnakeBar);
                  },
                  icon: const Icon(Icons.skip_previous_rounded),
                ),
                IconButton(
                  onPressed: () {
                    isClickedPlay = !isClickedPlay;
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(plyBtnSnakeBar);
                  },
                  icon: Icon(
                      isClickedPlay ? Icons.pause : Icons.play_arrow_rounded),
                ),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(nxtBtnSnakeBar);
                  },
                  icon: const Icon(Icons.skip_next_rounded),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
