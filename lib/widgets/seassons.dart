import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';

Widget SeassonWidget(Movie movieResponse, bool movie) {
  return movie
      ? const SizedBox(height: 0.0)
      : Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          alignment: Alignment.centerLeft,
          child: Text('${movieResponse.seasons!.length} Seassons',
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Color.fromARGB(255, 181, 181, 181), fontSize: 18.0)),
        );
}
