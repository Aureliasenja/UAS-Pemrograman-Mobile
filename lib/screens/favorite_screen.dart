import 'package:flutter/material.dart';
import 'package:uas_43a87006190306/utils/text.dart';
import 'package:uas_43a87006190306/widgets/toprated.dart';
import 'package:uas_43a87006190306/widgets/trending.dart';
import 'package:uas_43a87006190306/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final String apikey = 'df1e4c19994636d21a7eddc2a74524b5';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZjFlNGMxOTk5NDYzNmQyMWE3ZWRkYzJhNzQ1MjRiNSIsInN1YiI6IjYzYzAzNTAzZGY4NTdjMDBiYzIxMjlkZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UGT7w7TfkhjPzeFl8EOyY99jr9B-9A7W4maaCHAZthk';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: modified_text(
            text: 'My Favorite Movie',
            size: 20,
            color: Colors.white,
          ),
          // backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            TV(tv: tv),
            TrendingMovies(
              trending: trendingmovies,
            ),
            TopRatedMovies(
              toprated: topratedmovies,
            ),
          ],
        ));
  }
}
