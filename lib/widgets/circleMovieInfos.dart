import 'package:flutter/material.dart';

Widget CircleMovieInfos(String text, IconData icon) {
  return Container(
    margin: const EdgeInsets.all(4.0),
    alignment: Alignment.center,
    width: 110.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 19.0,
            color: Colors.white,
            fontFamily: 'Arial',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    ),
    height: 32.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 59, 56, 56),
    ),
  );
}
