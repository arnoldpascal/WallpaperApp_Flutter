import 'package:flutter/material.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Pixel",
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      Text("Wallpaper",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500))
    ],
  );
}

Widget credit() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Made by",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      Text(
        " Arnold Pascal",
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
      )
    ],
  );
}
