import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/repositories/movies/movies_repository.dart';

import 'movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesReporitory _moviesReporitory;

  const MoviesServiceImpl({
    required MoviesReporitory moviesReporitory,
  }) : _moviesReporitory = moviesReporitory;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesReporitory.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesReporitory.getTopRated();

  @override
  Future<MovieDetailModel?> getDetail(int id) =>
      _moviesReporitory.getDetail(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) =>
      _moviesReporitory.addOrRemoveFavorite(userId, movie);

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) =>
      _moviesReporitory.getFavoritiesMovies(userId);
}
