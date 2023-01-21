import 'dart:convert';

import 'package:uas_43a87006190306/model/movie_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MovieController extends GetxController {
  var isLoading = false.obs;
  final String url = 'https://api.themoviedb.org';
  // final String apikey = 'df1e4c19994636d21a7eddc2a74524b5';
  List<Movie> movies = [];
  Movie? movie;

  @override
  void onInit() {
    super.onInit();
    getMovies();
  }

  // Future<List<Movie>> getMovie() async {
  //   try {
  //     final response = await http.get(Uri.parse(
  //         '$url/3/movie/popular?api_key=df1e4c19994636d21a7eddc2a74524b5'));
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       // var movies = response.data
  //       // List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
  //       List<Movie>.from(data['results'].map((x) => Movie.fromJson(x)));
  //       // return movieList;
  //     }
  //   } catch (error, stacktrace) {
  //     throw Exception('Exception accoured: $error with stacktrace $stacktrace');
  //   }
  // }

  getMovies() async {
    isLoading(true);
    final response = await http.get(Uri.parse(
        '$url/3/movie/popular?api_key=df1e4c19994636d21a7eddc2a74524b5'));
    // isLoading.value = false;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Iterable list = data['results'];
      // return list.map((e) => Movie.fromJson(e)).toList();
      movies = List<Movie>.from(data['results'].map((x) => Movie.fromJson(x)));
      // return movies;
      print(movies);
    }
    isLoading(false);
  }

  findMovie(int id) async {
    movie = await getMovie(id);
  }

  Future<Movie?> getMovie(int id) async {
    isLoading(true);
    final response = await http.get(Uri.parse(
        '$url/3/movie/$id?api_key=df1e4c19994636d21a7eddc2a74524b5&language=en-US'));
    isLoading(false);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Movie.fromJson(data);
    }
    return null;
  }

  Future<Movie?> addRated(Movie movie) async {
    isLoading(true);
    final connect = GetConnect();
    final response = await connect.post(
        '$url/3/movie/${movie.id}/rating?api_key=df1e4c19994636d21a7eddc2a74524b5',
        movie.toMap());
    print(response.body);
    isLoading(false);
    if (response.statusCode == 200) {
      return Movie.fromJson(response.body);
    }
    return null;
  }

  Future<Movie?> updateRated(Movie movie) async {
    isLoading(true);
    final connect = GetConnect();
    final response = await connect.post(
        '$url/3/movie/${movie.id}/rating?api_key=df1e4c19994636d21a7eddc2a74524b5',
        movie.toMap());
    print(response.body);
    isLoading(false);
    if (response.statusCode == 200) {
      return Movie.fromJson(response.body);
    }
    return null;
  }

  Future<Movie?> deleteRated(int id) async {
    isLoading(true);
    final connect = GetConnect();
    final response = await connect.delete(
        '$url/3/movie/${movie!.id}/rating?api_key=df1e4c19994636d21a7eddc2a74524b5');
    print(response.body);
    isLoading(false);
    if (response.statusCode == 200) {
      return Movie.fromJson(response.body);
      // final data = jsonDecode(response.body);
      // return Movie.fromJson(data);
    }
    return null;
  }
}
