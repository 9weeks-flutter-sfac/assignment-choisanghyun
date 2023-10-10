import 'dart:convert';

import 'package:assignment2/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String basicUrl = 'https://www.nature.com';
  @override
  Widget build(BuildContext context) {
    Future<dynamic> readJson() async {
      List<News> news = [];
      final jsonString = await rootBundle.loadString('assets/newsdata.json');
      final jsonData = json.decode(jsonString);

      for (var item in jsonData) {
        news.add(News.fromJson(item));
      }
      return news;
    }

    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: FutureBuilder(
          future: readJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    News newsData = snapshot.data[index];
                    var timeData = DateTime.tryParse(newsData.datePublished);
                    String newsUrl = basicUrl + newsData.articleUrl;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          launchUrlString(newsUrl);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 150,
                                    child: Text(
                                      newsData.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          decoration: TextDecoration.underline),
                                    )),
                                SizedBox(
                                    height: 50,
                                    width: 100,
                                    child: Image.network(
                                      newsData.imgUrl,
                                      fit: BoxFit.fill,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              newsData.creator,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  newsData.type,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(DateFormat.yMMMd().format(timeData!)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshot.data.length);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      )),
    );
  }
}
