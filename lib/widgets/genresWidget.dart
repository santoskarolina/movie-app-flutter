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
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  // alignment: Alignment.center,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: const BorderSide(width: 0),
                            label: Text(
                              data[index].name!,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ));
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
