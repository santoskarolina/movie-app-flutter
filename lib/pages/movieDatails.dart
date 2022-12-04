import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/services/service.dart';
import 'package:movie_app/widgets/movieDetalilsBox.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    Key? key,
    required this.movieID,
    required this.movie,
  }) : super(key: key);
  final int movieID;
  final bool movie;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Future<Movie> movieFuture;
  late Future<MoviesReponse> simularMoviesFuture;
  late Future<Cast> castFuture;

  @override
  void initState() {
    movieFuture = getMoviebyId(widget.movieID, widget.movie);
    simularMoviesFuture = getSimilarMovies(widget.movieID, widget.movie);
    castFuture = getCast(widget.movieID, widget.movie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Movie>(
        future: movieFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieResponse = snapshot.data;
            var movieDate = widget.movie
                ? movieResponse!.releaseDate
                : movieResponse!.firstAirDate;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  snap: true,
                  floating: true,
                  expandedHeight: MediaQuery.of(context).size.width * 0.9,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const <StretchMode>[
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                    centerTitle: true,
                    title: Text(
                      widget.movie
                          ? movieResponse.originalTitle!
                          : movieResponse.originalName!,
                      style: const TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        movieResponse.backdropPath != null
                            ? Image.network(
                                '$imageUrl${movieResponse.backdropPath}',
                                fit: BoxFit.cover)
                            : Container(
                                color: Colors.grey,
                              ),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: <Color>[
                                Color(0x60000000),
                                Color(0x00000000),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      return ContextBoxMovie(movieResponse, movieDate,
                          widget.movie, simularMoviesFuture, castFuture);
                    },
                    childCount: 1,
                  ),
                ),
              ],
            );
          }
          return Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 1, 21, 36)),
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
