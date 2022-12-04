import 'package:flutter/material.dart';
import 'package:movie_app/models/genres.model.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    Key? key,
    required this.future,
  }) : super(key: key);

  final Future<GenresResponse> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GenresResponse>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data?.genres;
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: Chip(
                        backgroundColor:
                            const Color.fromARGB(255, 108, 104, 104),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: const BorderSide(width: 0),
                        label: Text(
                          data[index].name!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ));
                },
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
