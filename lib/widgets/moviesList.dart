import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/widgets/movieBoxComp.dart';

class MoviesList extends StatelessWidget {
  const MoviesList(
      {Key? key,
      required this.headlineText,
      required this.future,
      required this.movie,
      required this.topRatedMovies})
      : super(key: key);

  final String headlineText;
  final bool movie;
  final Future<MoviesReponse> future;
  final bool topRatedMovies;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesReponse>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data?.results;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headlineText,
                  style: const TextStyle(color: Colors.white, fontSize: 22.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 310,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return MovieBox(
                          data, index, context, movie, topRatedMovies);
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
