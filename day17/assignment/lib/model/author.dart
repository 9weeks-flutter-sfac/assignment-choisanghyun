// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Author {
  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<Item> items;

  Author({
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

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
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

  factory Author.fromJson(String source) =>
      Author.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Item {
  String? avatar;
  String collectionId;
  String collectionName;
  String created;
  bool emailVisibility;
  String id;
  String name;
  String updated;
  String? username;
  bool verified;

  Item({
    required this.avatar,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.emailVisibility,
    required this.id,
    required this.name,
    required this.updated,
    required this.username,
    required this.verified,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar': avatar,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'emailVisibility': emailVisibility,
      'id': id,
      'name': name,
      'updated': updated,
      'username': username,
      'verified': verified,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      avatar: map['avatar'] as String? ?? '',
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: map['created'] as String,
      emailVisibility: map['emailVisibility'] as bool? ?? false,
      id: map['id'] as String,
      name: map['name'] as String? ?? '',
      updated: map['updated'] as String,
      username: map['username'] as String? ?? '',
      verified: map['verified'] as bool? ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
