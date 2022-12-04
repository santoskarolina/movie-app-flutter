import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';
import 'package:movie_app/widgets/castWidget.dart';
import 'package:movie_app/widgets/circleMovieInfos.dart';
import 'package:movie_app/widgets/genresWidget.dart';
import 'package:movie_app/widgets/lastEpisode.dart';
import 'package:movie_app/widgets/moviesList.dart';
import 'package:movie_app/widgets/overviewWidget.dart';
import 'package:movie_app/widgets/seassons.dart';

Widget ContextBoxMovie(Movie movieResponse, movieDate, bool movie,
    simularMoviesFuture, castFuture) {
  return Container(
      padding: const EdgeInsets.all(20.0),
      // height: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 1, 21, 36),
      child: Column(
        children: [
          // GenresWidget(movieResponse),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleMovieInfos('${movieResponse.voteAverage}', Icons.note_add),
              CircleMovieInfos(movieDate.toString().split('-')[0],
                  Icons.calendar_month_sharp),
              movie
                  ? CircleMovieInfos(
                      '${movieResponse.runtime} min', Icons.watch_later)
                  : const SizedBox(height: 0.0, width: 0.0)
            ],
          ),
          OverviewWidget(movieResponse),
          const SizedBox(
            height: 10.0,
          ),
          SeassonWidget(movieResponse, movie),
          const SizedBox(
            height: 10.0,
          ),
          MoviesList(
              headlineText: 'Similar',
              topRatedMovies: false,
              future: simularMoviesFuture,
              movie: movie),
          LastEpisodeWidget(movieResponse, movie),
          CastList(headlineText: 'Cast', future: castFuture),
        ],
      ));
}
