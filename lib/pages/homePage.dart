// ignore: file_names
import 'package:flutter/material.dart';
import 'package:movie_app/models/genres.model.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/services/service.dart';
import 'package:movie_app/widgets/genresWidget.dart';
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

  late Future<GenresResponse>? genresFuture;

  @override
  void initState() {
    popularMoviesFuture = getPopularMovies(true);
    popularTvFuture = getPopularMovies(false);
    topRatedMovies = getTopRatedMovies();
    genresFuture = getGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 1, 21, 36)),
        ),
        homeBox(),
      ],
    ));
  }

  Widget homeBox() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(2.0, 20.0, 2.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderComp(),
            SearchComp(),
            GenresWidget(future: genresFuture!),
            MoviesList(
              headlineText: 'Top rated',
              future: topRatedMovies!,
              movie: true,
              topRatedMovies: true,
            ),
            MoviesList(
              headlineText: 'Popular movies',
              future: popularMoviesFuture!,
              movie: true,
              topRatedMovies: false,
            ),
            MoviesList(
              headlineText: 'Popular movies',
              future: popularMoviesFuture!,
              movie: true,
              topRatedMovies: false,
            ),
            MoviesList(
                headlineText: 'Popular tv shows',
                future: popularTvFuture!,
                movie: false,
                topRatedMovies: false),
          ],
        ),
      ),
    );
  }
}
