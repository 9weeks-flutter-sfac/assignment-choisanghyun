// 추가 코드를 작성할 것. 본 소스는 디자인만 작성되어 있으며
// 이 기본 틀을 통하여 과제에 필요한 소스코드를 추가적으로 구현할 것.
import 'package:dictionaryapp/model/dictionary.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dict? dictionary;
  String searchWord = '';
  Future<Dict> getData(String word) async {
    Dio dio = Dio();
    try {
      var res = await dio
          .get('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
      if (res.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(res.data);
        dictionary = Dict.fromMap(data.first);
        return dictionary!;
      }
      return dictionary!;
    } catch (e) {
      if (e is DioException) {
        // DioError에 대한 처리 로직
        if (e.response != null) {
          searchWord = "";
          setState(() {});
          // 서버로부터 응답 받은 경우의 오류 처리
        }
      }
      return dictionary!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSubmitted: (value) {
                        searchWord = value;
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
            searchWord != ''
                ? FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            decoration: const BoxDecoration(color: Colors.grey),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                children: [
                                  Text(
                                    dictionary!.word,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Meanings',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height,
                                    child: ListView.builder(
                                      itemCount: dictionary!.meanings.length,
                                      itemBuilder: (context, index) {
                                        return MeanigCard(
                                          dictionary: dictionary,
                                          index: index,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    future: getData(searchWord),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class MeanigCard extends StatelessWidget {
  const MeanigCard({
    super.key,
    required this.dictionary,
    required this.index,
  });

  final Dict? dictionary;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dictionary!.meanings[index].partOfSpeech,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0;
                i < dictionary!.meanings[index].definitions.length;
                i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '- ${dictionary!.meanings[index].definitions[i].definition}'),
                  dictionary!.meanings[index].definitions[i].synonyms.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text("synonyms : "),
                              for (int j = 0;
                                  j <
                                      dictionary!.meanings[index].definitions[i]
                                          .synonyms.length;
                                  j++)
                                Text(
                                    '${dictionary!.meanings[index].definitions[i].synonyms[j]},'),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
