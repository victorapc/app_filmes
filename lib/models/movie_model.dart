import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite;

  const MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'release_date': this.releaseDate,
      'poster_path': this.posterPath,
      'genre_ids': this.genres,
      'favorite': this.favorite,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      releaseDate: map['release_date'] ?? '',
      posterPath: 'https://image.tmdb.org/t/p/w200${map['poster_path']}' ?? '',
      genres: List<int>.from(map['genre_ids'] ?? const []),
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String sourse) =>
      MovieModel.fromMap(json.decode(sourse));
}
