import 'package:app_filmes/modules/movie_detail/movie_datail_controller.dart';
import 'package:app_filmes/modules/movie_detail/widget/movie_detail_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              MovieDetailHeader(
                movie: controller.movie.value,
              ),
            ],
          );
        }),
      ),
    );
  }
}
