import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:get/get.dart';

class MoviesBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesController());
  }
}
