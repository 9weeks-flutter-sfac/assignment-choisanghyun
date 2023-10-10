class News {
  String title;
  String imgUrl;
  String creator;
  String type;
  String articleUrl;
  String datePublished;

  News({
    required this.title,
    required this.imgUrl,
    required this.creator,
    required this.type,
    required this.articleUrl,
    required this.datePublished,
  });

  News.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        imgUrl = json['imgUrl'],
        creator = json['creator'],
        type = json['type'],
        articleUrl = json['articleUrl'],
        datePublished = json['datePublished'];
}
