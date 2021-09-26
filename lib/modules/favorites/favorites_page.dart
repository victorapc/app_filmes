import 'package:app_filmes/application/ui/widgets/movie_card.dart';
import 'package:app_filmes/modules/favorites/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favoritos'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: Get.width,
            child: Wrap(
              //Serve como coluna só que quebra a linha caso precisa.
              alignment: WrapAlignment.spaceAround,
              children: controller.movies
                  .map(
                    (m) => MovieCard(
                      movie: m,
                      favoriteCallBack: () => controller.removeFavorite(m),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }),
    );
  }
}
