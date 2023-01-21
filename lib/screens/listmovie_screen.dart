import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uas_43a87006190306/controller/movie_controller.dart';
import 'package:uas_43a87006190306/screens/movie_detail.dart';
import 'package:get/get.dart';
import 'package:uas_43a87006190306/model/movie_model.dart';
import 'package:http/http.dart' as http;

class ListMovieScreen extends StatelessWidget {
  ListMovieScreen({super.key});
  final controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Movie'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         controller.findProduct(0);
        //         Get.to(() => MovieDetail());
        //       },
        //       icon: const Icon(Icons.add_box))
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    mainAxisExtent: 280),
                itemCount: controller.movies.length,
                itemBuilder: (context, index) {
                  final movie = controller.movies[index];
                  return SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white12),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          controller.findMovie(movie.id);
                          Get.to(() => MovieDetail());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: SizedBox(
                                width: Size.infinite.width,
                                height: 196,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500" +
                                        movie.poster_path,
                                    fit: BoxFit.fill,
                                  ),
                                  // Image.network(
                                  //   "https://image.tmdb.org/t/p/w500" +
                                  //       movie.poster_path,
                                  //   fit: BoxFit.fill,
                                  // ),
                                  // NetworkImage(
                                  //     'https://image.tmdb.org/t/p/w500' +
                                  //         moviee[result]['poster_path'])
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 2,
                            // ),
                            Container(
                              width: Size.infinite.width,
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   product.category,
                                  //   style: const TextStyle(
                                  //       color: Colors.blue, fontSize: 12),
                                  // ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),
                                  Text(
                                    movie.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 12,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        '${movie.vote_average}',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   'Release ${movie.release_date}',
                                  //   maxLines: 2,
                                  //   style: const TextStyle(
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w700),
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
