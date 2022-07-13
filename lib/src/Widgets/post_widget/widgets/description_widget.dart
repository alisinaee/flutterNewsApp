import 'package:flutter/material.dart';

Widget descriptionWidget(String txt) {
  return Text(
    txt,
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
      color: Colors.white70,
      fontSize: 14,
    ),
  );
}
