import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:offlineassignment/models/dramamovie.dart';
import 'package:offlineassignment/moviecard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var pageController = PageController(viewportFraction: 0.8);
  List<dynamic>? dramaMovies;
  getData() async {
    Dio dio = Dio();
    var res =
        await dio.get('https://api.tablebackend.com/v1/rows/OHrzhGhr68So');

    // print(res.data['data'].runtimeType);
    var items = res.data['data'].map((e) => DramaMovie.fromMap(e));
    dramaMovies = items.toList();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              title: const Text('박스오피스'),
              leading: IconButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                icon: const Icon(Icons.keyboard_arrow_left),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: const Icon(Icons.keyboard_arrow_right),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: PageView.builder(
              controller: pageController,
              itemCount: dramaMovies!.length,
              itemBuilder: (context, index) => MovieCard(
                movie: dramaMovies?[index],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                pageController.jumpToPage(0);
                setState(() {});
              },
              child: const Icon(
                Icons.refresh,
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
