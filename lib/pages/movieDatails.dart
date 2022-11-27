import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/services/service.dart';
import 'package:movie_app/widgets/circleMovieInfos.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    Key? key,
    required this.movieID,
  }) : super(key: key);
  final int movieID;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Future<Movie>? movieFuture;

  @override
  void initState() {
    movieFuture = getMoviebyId(widget.movieID);
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
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.width * 0.9,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const <StretchMode>[
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                    centerTitle: true,
                    title: Text(
                      '${movieResponse?.originalTitle}',
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
                      children: <Widget>[
                        movieResponse!.backdropPath != null
                            ? Image.network(
                                '$imageUrl${movieResponse.backdropPath}',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: double.infinity,
                                    // width: MediaQuery.of(context).size.width * 0.9,
                                    color: Colors.grey,
                                  );
                                },
                              )
                            : Container(
                                height: double.infinity,
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
                      return Container(
                        color: Colors.black,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(children: [
                                for (int i = 0;
                                    i < movieResponse.genres!.length;
                                    i++)
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 6.0, right: 6.0),
                                    child: Text(
                                      movieResponse.genres![i]['name'],
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 110, 103, 103),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  )
                              ]),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10.0),
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 10.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${movieResponse.overview}',
                                style: const TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleMovieInfos('${movieResponse.voteAverage}',
                                    Icons.note_add),
                                CircleMovieInfos(
                                    movieResponse.releaseDate
                                        .toString()
                                        .split('-')[0],
                                    Icons.calendar_month_sharp),
                                CircleMovieInfos('${movieResponse.runtime} min',
                                    Icons.watch_later),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
