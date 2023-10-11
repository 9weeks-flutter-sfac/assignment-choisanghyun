// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dog {
  String message;
  String status;

  Dog({
    required this.message,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      message: map['message'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) =>
      Dog.fromMap(json.decode(source) as Map<String, dynamic>);
}
