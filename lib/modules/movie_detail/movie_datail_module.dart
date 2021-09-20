import 'package:app_filmes/application/modules/module.dart';
import 'package:app_filmes/modules/movie_detail/movie_datail_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'movie_datail_page.dart';

class MovieDetailModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => MovieDetailPage(),
      binding: MovieDetailBindings(),
    )
  ];
}
