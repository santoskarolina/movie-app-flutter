import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';

Widget OverviewWidget(Movie movieResponse) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0),
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
  );
}
