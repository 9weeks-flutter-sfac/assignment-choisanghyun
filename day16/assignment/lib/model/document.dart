// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Document {
  int page;
  int perPage;
  int totalPages;
  int totalItems;
  List<Item> items;

  Document({
    required this.page,
    required this.perPage,
    required this.totalPages,
    required this.totalItems,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'totalPages': totalPages,
      'totalItems': totalItems,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      page: map['page'] as int,
      perPage: map['perPage'] as int,
      totalPages: map['totalPages'] as int,
      totalItems: map['totalItems'] as int,
      items: List<Item>.from(
        (map['items'] as List<dynamic>).map<Item>(
          (x) => Item.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Document.fromJson(String source) =>
      Document.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Item {
  String id;
  String collectionId;
  String collectionName;
  String title;
  String content;
  String attachment;
  String? attachmentUrl;

  Item({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.title,
    required this.content,
    required this.attachment,
    required this.attachmentUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'title': title,
      'content': content,
      'attachment': attachment,
      'attachmentUrl': attachmentUrl,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      attachment: map['attachment'] as String,
      attachmentUrl: map['attachment_url'] != '' ? map['attachment_url'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
