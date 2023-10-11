// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DramaMovie {
  String? id;
  int createdAt;
  int updatedAt;
  String title;
  String? rating;
  String? releaseDate;
  String? runningTime;
  String? actor;
  String genre;

  DramaMovie({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    this.rating,
    required this.releaseDate,
    required this.runningTime,
    this.actor,
    required this.genre,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'title': title,
      'rating': rating,
      'releaseDate': releaseDate,
      'runningTime': runningTime,
      'actor': actor,
      'genre': genre,
    };
  }

  factory DramaMovie.fromMap(Map<String, dynamic> map) {
    return DramaMovie(
      id: map['_id'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
      title: map['title'] as String,
      rating: map['rating'] as String,
      releaseDate: map['release_date'] as String?,
      runningTime: map['running_time'] as String?,
      actor: map['actor'] as String,
      genre: map['genre'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DramaMovie.fromJson(String source) =>
      DramaMovie.fromMap(json.decode(source) as Map<String, dynamic>);
}
