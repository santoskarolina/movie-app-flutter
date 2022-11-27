// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget HeaderComp() {
  return Container(
    padding: EdgeInsets.all(12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              height: 60,
              width: 60,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Hello, Justin',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                  Text('Enjoy your favorities movies!',
                      style: TextStyle(color: Colors.white, fontSize: 16))
                ]),
          ],
        ),
        SizedBox(
          child: Icon(
            Icons.notifications,
            color: Colors.white,
            size: 36.0,
          ),
        ),
      ],
    ),
  );
}
