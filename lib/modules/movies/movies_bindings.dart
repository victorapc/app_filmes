import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';
import 'package:app_filmes/repositories/genres/genres_repository_impl.dart';
import 'package:app_filmes/services/geners/genres_service.dart';
import 'package:app_filmes/services/geners/genres_service_impl.dart';
import 'package:get/get.dart';

class MoviesBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepository: Get.find()));

    Get.lazyPut(() => MoviesController(genresService: Get.find()));
  }
}
