import 'package:flutter/material.dart';

Widget logoWidget() {
  return const Padding(
    padding: EdgeInsets.all(20),
    child: Center(
      child: Text(
        'AKO NEWS',
        style: TextStyle(
          color: Colors.amber,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          letterSpacing: 10,
          wordSpacing: 10,
        ),
      ),
    ),
  );
}
