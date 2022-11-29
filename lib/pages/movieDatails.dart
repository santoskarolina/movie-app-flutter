import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/services/service.dart';
import 'package:movie_app/widgets/circleMovieInfos.dart';

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
  late Future<Movie>? movieFuture;
  var noImage = 'https://www.kibrispdr.org/data/753/no-image-found-png-23.png';

  @override
  void initState() {
    movieFuture =
        widget.movie ? getMoviebyId(widget.movieID) : getTVbyId(widget.movieID);
    super.initState();
    print(widget.movieID);
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
                          ? '${movieResponse?.originalTitle}'
                          : '${movieResponse?.originalName}',
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
                      return contentBox(movieResponse, movieDate);
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

  Widget contentBox(Movie movieResponse, movieDate) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        // height: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            Wrap(
              children: List.generate(
                  movieResponse.genres!.length,
                  (genreIndex) => Padding(
                        padding: const EdgeInsets.only(right: 10, top: 4),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(width: 0),
                          backgroundColor:
                              const Color.fromARGB(255, 79, 73, 73),
                          label: Text(
                            movieResponse.genres![genreIndex]['name'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white70),
                          ),
                        ),
                      )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleMovieInfos(
                    '${movieResponse.voteAverage}', Icons.note_add),
                CircleMovieInfos(movieDate.toString().split('-')[0],
                    Icons.calendar_month_sharp),
                widget.movie
                    ? CircleMovieInfos(
                        '${movieResponse.runtime} min', Icons.watch_later)
                    : const SizedBox(height: 0.0, width: 0.0)
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
            const SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Seassons',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(255, 181, 181, 181),
                      fontSize: 18.0)),
            ),
            Wrap(
              children: List.generate(
                  movieResponse.seasons!.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(right: 10, top: 4),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(width: 0),
                          backgroundColor:
                              const Color.fromARGB(255, 79, 73, 73),
                          label: Text(
                            movieResponse.seasons![index].name!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text('Last Epsoide to air',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18.0)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        movieResponse.lastEpisode?.stillPath != null
                            ? '$imageUrl${movieResponse.lastEpisode?.stillPath!}'
                            : noImage,
                        height: 240,
                        width: 170,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 240,
                            width: 170,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 170,
                    height: 50,
                    margin: const EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movieResponse.lastEpisode!.name!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            movieResponse.lastEpisode!.airDate!
                                .toString()
                                .split('-')[0],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
