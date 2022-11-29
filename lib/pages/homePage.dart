// ignore: file_names
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/services/service.dart';
import 'package:movie_app/widgets/headerComp.dart';
import 'package:movie_app/widgets/moviesList.dart';
import 'package:movie_app/widgets/searchComp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<MoviesReponse>? popularMoviesFuture,
      popularTvFuture,
      topRatedMovies;

  @override
  void initState() {
    popularMoviesFuture = getPopularMovies();
    popularTvFuture = getPopularTvShows();
    topRatedMovies = getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 26, 24, 24),
          ),
        ),
        homeBox(),
      ],
    ));
  }

  Widget homeBox() {
    return Container(
      padding: const EdgeInsets.fromLTRB(2.0, 20.0, 2.0, 0.0),
      child: ListView(
        children: [
          HeaderComp(),
          SearchComp(),
          MoviesList(
            headlineText: 'Populat movies',
            future: popularMoviesFuture!,
            movie: true,
          ),
          MoviesList(
            headlineText: 'Top rated',
            future: topRatedMovies!,
            movie: true,
          ),
          MoviesList(
            headlineText: 'Popular tv shows',
            future: popularTvFuture!,
            movie: false,
          ),
        ],
      ),
    );
  }
}
