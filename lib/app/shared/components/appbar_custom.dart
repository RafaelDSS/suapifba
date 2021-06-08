import 'package:flutter/material.dart';

Widget appBarDefault({String title = ''}) {
  return AppBar(
    title: Text(title),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
  );
}
