import 'dart:convert';

class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModel.fromJson(String sourse) => GenreModel.fromMap(json.decode(sourse));
}
