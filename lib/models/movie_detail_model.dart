import 'dart:convert';

import 'package:app_filmes/models/cast_model.dart';
import 'package:app_filmes/models/genre_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;

  const MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'stars': this.stars,
      'genres': this.genres.map((x) => x.toMap()).toList(),
      'urlImages': this.urlImages,
      'releaseDate': this.releaseDate.millisecondsSinceEpoch,
      'overview': this.overview,
      'productionCompanies': this.productionCompanies,
      'originalLanguage': this.originalLanguage,
      'cast': this.cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPosters = map['images']['posters'];
    var urlImages = urlImagesPosters
            ?.map<String>(
                (i) => 'https://image.tmdb.org/t/p/w200${i['file_path']}')
            .toList() ??
        const [];

    return MovieDetailModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0.0,
      genres: List<GenreModel>.from(
          map['genres']?.map((x) => GenreModel.fromMap(x)) ?? const []),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies:
          List<dynamic>.from(map['production_companies'] ?? const [])
              .map<String>((p) => p['name'])
              .toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(
          map['credits']['cast']?.map((x) => CastModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String sourse) =>
      MovieDetailModel.fromMap(json.decode(sourse));
}
