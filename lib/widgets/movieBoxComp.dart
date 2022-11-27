import 'package:flutter/material.dart';
import 'package:movie_app/pages/movieDatails.dart';
import 'package:movie_app/services/service.dart';

Widget MovieBox(data, index, context) {
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
                    builder: (context) =>
                        MovieDetails(movieID: data[index].id)));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              '$imageUrl${data[index].posterPath}',
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
