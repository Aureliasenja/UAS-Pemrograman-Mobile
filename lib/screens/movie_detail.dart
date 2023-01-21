import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uas_43a87006190306/controller/movie_controller.dart';
import 'package:uas_43a87006190306/model/movie_model.dart';
import 'package:get/get.dart';

class MovieDetail extends StatelessWidget {
  MovieDetail({super.key});
  final controller = Get.put(MovieController());

  final titleController = TextEditingController();
  final overviewController = TextEditingController();
  final voteaverageController = TextEditingController(text: '0,0');
  final releaseController = TextEditingController();
  final posterController = TextEditingController();

  saveRated() async {
    final movie = Movie(
        id: 0,
        title: titleController.text,
        overview: overviewController.text,
        vote_average: 0.0,
        release_date: releaseController.text,
        poster_path: posterController.text);
    dynamic result;

    if (controller.movie == null) {
      result = await controller.addRated(movie);
    } else {
      movie.id = controller.movie!.id;
      result = await controller.updateRated(movie);
    }

    if (result != null) {
      Get.back();
      Get.snackbar('Save Rating Success', 'Rated saved with id ${result.id}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } else {
      Get.snackbar('Save Rating Error', 'Please check your data',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  deleteRated() async {
    dynamic result;
    print(controller.movie);
    if (controller.movie != null) {
      result = await controller.deleteRated(controller.movie!.id.toInt());
    }

    if (result != null) {
      Get.back();
      Get.snackbar('Delete Rating Success', 'Rating deleted!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } else {
      Get.snackbar('Delete Rating Error', 'Please check your data',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
        actions: [
          IconButton(
              onPressed: () {
                deleteRated();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Obx(() {
        if (controller.movie != null) {
          final movie = controller.movie!;
          titleController.text = movie.title;
          overviewController.text = movie.overview;
          voteaverageController.text = movie.vote_average.toString();
          releaseController.text = movie.release_date;
          posterController.text = movie.poster_path;
        } else {
          titleController.text = '';
          overviewController.text = '';
          voteaverageController.text = '0';
          releaseController.text = '';
          posterController.text = '';
        }
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    const Text('Title'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.movie!.title,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Description'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.movie!.overview,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Release Date'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.movie!.release_date,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Poster Path'),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   height: 200,
                    //   width: 100,
                    //   child: Image.network(posterurl),
                    // ),
                    SizedBox(
                      // width: 10,
                      height: 196,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500" +
                              controller.movie!.poster_path,
                          // fit: BoxFit.fill,
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Vote Average'),
                    TextField(
                      controller: voteaverageController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          saveRated();
                        },
                        child: const Text('Save'))
                  ],
                ),
              );
      }),
    );
  }
}
