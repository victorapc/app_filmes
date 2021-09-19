import 'dart:convert';

class CastModel {
  final String name;
  final String image;
  final String character;

  const CastModel({
    required this.name,
    required this.image,
    required this.character,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'character': this.character,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      name: map['original_name'] ?? '',
      image: 'https://image.tmdb.org/t/p/w200${map['profile_path']}' ?? '',
      character: map['character'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String sourse) => CastModel.fromMap(json.decode(sourse));
}