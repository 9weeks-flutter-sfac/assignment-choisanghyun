import 'package:assignment/dogrescontainerwidget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  late List<dynamic> dogRes = [];

  var dio = Dio();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((result) {
      _connectivityResult = result;
      setState(() {});
    });
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = connectivityResult;
    });
  }

  Future<dynamic> getDogsRes() async {
    print('builder Refresh');
    var dio = Dio();
    try {
      var res = await dio.get('https://sniperfactory.com/sfac/http_day16_dogs');
      dogRes = res.data["body"];
      return res;
    } catch (e) {
      print(e);
    }
  }

  void _onRefresh() async {
    // monitor network fetch

    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('8일차 과제'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: (_connectivityResult == ConnectivityResult.wifi ||
                _connectivityResult == ConnectivityResult.mobile)
            ? FutureBuilder(
                future: getDogsRes(),
                builder: (context, snapshot) {
                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SmartRefresher(
                      enablePullDown: true,
                      controller: _refreshController,
                      header: const WaterDropHeader(),
                      onRefresh: _onRefresh,
                      child: GridView.builder(
                          itemCount: dogRes.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                            childAspectRatio: 1 / 1.25, //item 의 가로 1, 세로 2 의 비율
                            mainAxisSpacing: 10, //수평 Padding
                            crossAxisSpacing: 10, //수직 Padding
                          ),
                          itemBuilder: (context, index) =>
                              snapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: DogResContainerWidget(
                                          dogMsg: dogRes[index]['msg'],
                                          dogImgUrl: dogRes[index]['url']),
                                    )
                                  : DogResContainerWidget(
                                      dogMsg: dogRes[index]['msg'],
                                      dogImgUrl: dogRes[index]['url'])),
                    ),
                  );
                },
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('인터넷 확인 중 입니다'),
                  CircularProgressIndicator(),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await checkConnectivity();
        },
        child: const Icon(Icons.wifi_find_rounded),
      ),
    );
  }
}
