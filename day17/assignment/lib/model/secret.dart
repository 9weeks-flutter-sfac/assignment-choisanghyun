// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Secret {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<Item> items;

  Secret({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'totalItems': totalItems,
      'totalPages': totalPages,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      page: map['page'] as int,
      perPage: map['perPage'] as int,
      totalItems: map['totalItems'] as int,
      totalPages: map['totalPages'] as int,
      items: List<Item>.from(
        (map['items'] as List<dynamic>).map<Item>(
          (x) => Item.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Secret.fromJson(String source) =>
      Secret.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Item {
  String author;
  String authorName;
  String collectionId;
  String collectionName;
  String created;
  String id;
  String secret;
  String updated;

  Item({
    required this.author,
    required this.authorName,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.secret,
    required this.updated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'authorName': authorName,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'id': id,
      'secret': secret,
      'updated': updated,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      author: map['author'] as String,
      authorName: map['authorName'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: map['created'] as String,
      id: map['id'] as String,
      secret: map['secret'] as String,
      updated: map['updated'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
