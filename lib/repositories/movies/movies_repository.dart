import 'package:app_filmes/models/movie_model.dart';

abstract class MoviesReporitory {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
}