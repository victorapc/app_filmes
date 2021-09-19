
import 'package:app_filmes/modules/movie_detail/movie_datail_controller.dart';
import 'package:get/get.dart';

class MovieDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailController());
  }

}