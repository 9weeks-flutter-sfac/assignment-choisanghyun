// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dict {
  String word;
  String phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
  License license;
  List<dynamic> sourceUrls;

  Dict({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics.map((x) => x.toMap()).toList(),
      'meanings': meanings.map((x) => x.toMap()).toList(),
      'license': license.toMap(),
      'sourceUrls': sourceUrls,
    };
  }

  factory Dict.fromMap(Map<String, dynamic> map) {
    return Dict(
      word: map['word'] as String,
      phonetic: map['phonetic'] as String,
      phonetics: List<Phonetic>.from(
        (map['phonetics'] as List<dynamic>).map<Phonetic>(
          (x) => Phonetic.fromMap(x as Map<String, dynamic>),
        ),
      ),
      meanings: List<Meaning>.from(
        (map['meanings'] as List<dynamic>).map<Meaning>(
          (x) => Meaning.fromMap(x as Map<String, dynamic>),
        ),
      ),
      license: License.fromMap(map['license'] as Map<String, dynamic>),
      sourceUrls: List<dynamic>.from((map['sourceUrls'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Dict.fromJson(String source) =>
      Dict.fromMap(json.decode(source) as Map<String, dynamic>);
}

class License {
  String name;
  String url;

  License({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory License.fromMap(Map<String, dynamic> map) {
    return License(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory License.fromJson(String source) =>
      License.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;
  List<dynamic> synonyms;
  List<dynamic> antonyms;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partOfSpeech': partOfSpeech,
      'definitions': definitions.map((x) => x.toMap()).toList(),
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }

  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      partOfSpeech: map['partOfSpeech'] as String,
      definitions: List<Definition>.from(
        (map['definitions'] as List<dynamic>).map<Definition>(
          (x) => Definition.fromMap(x as Map<String, dynamic>),
        ),
      ),
      synonyms: List<dynamic>.from((map['synonyms'] as List<dynamic>)),
      antonyms: List<dynamic>.from((map['antonyms'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Meaning.fromJson(String source) =>
      Meaning.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Definition {
  String definition;
  List<dynamic> synonyms;
  List<dynamic> antonyms;
  String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'definition': definition,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'example': example,
    };
  }

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
      definition: map['definition'] as String,
      synonyms: List<dynamic>.from((map['synonyms'] as List<dynamic>)),
      antonyms: List<dynamic>.from((map['antonyms'] as List<dynamic>)),
      example: map['example'] != null ? map['example'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Definition.fromJson(String source) =>
      Definition.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Phonetic {
  String text;
  String audio;
  String sourceUrl;

  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'audio': audio,
      'sourceUrl': sourceUrl,
      //'license': license!.toMap(),
    };
  }

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
      text: map['text'] as String,
      audio: map['audio'] as String,
      sourceUrl: map['sourceUrl'] as String,
      //license: License?.fromMap(map['license']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Phonetic.fromJson(String source) =>
      Phonetic.fromMap(json.decode(source) as Map<String, dynamic>);
}
