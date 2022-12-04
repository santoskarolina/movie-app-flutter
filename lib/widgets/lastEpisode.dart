import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.model.dart';

import '../services/service.dart';

Widget LastEpisodeWidget(Movie movie, bool movieRe) {
  return movieRe
      ? const SizedBox(height: 0.0)
      : Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: movie.lastEpisode?.stillPath != null
                          ? Image.network(
                              '$imageUrl${movie.lastEpisode?.stillPath!}',
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
                            )
                          : SizedBox(
                              child: Image.asset('assets/no-image.png',
                                  fit: BoxFit.cover),
                              height: 240,
                              width: 170,
                            )),
                  Container(
                    width: 170,
                    height: 50,
                    margin: const EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.lastEpisode?.name ?? 'Sem nome',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
}
