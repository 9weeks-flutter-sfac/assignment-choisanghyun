// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  String name;
  String description;
  String imageUrl;
  int price;

  Post({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  Post.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        imageUrl = json['image'],
        price = json['price'];
}
