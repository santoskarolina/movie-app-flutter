import 'package:flutter/material.dart';
import 'package:movie_app/pages/movieDatails.dart';
import 'package:movie_app/services/service.dart';

Widget MovieBox(data, index, context, bool movie, bool topRatedMovies) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetails(
                          movieID: data[index].id,
                          movie: movie,
                        )));
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: data[index].posterPath != null
                  ? Image.network(
                      '$imageUrl${data[index].posterPath}',
                      height: 240,
                      width: topRatedMovies
                          ? MediaQuery.of(context).size.height * 0.5
                          : 180,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/no-image.png',
                      height: 240,
                      fit: BoxFit.cover,
                      width: topRatedMovies
                          ? MediaQuery.of(context).size.height * 0.5
                          : 180,
                    )),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
          width:
              topRatedMovies ? MediaQuery.of(context).size.height * 0.5 : 150,
          margin: const EdgeInsets.only(left: 5, top: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data[index].title ?? data[index].name!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0)),
            ],
          ),
        ),
      ],
    ),
  );
}
