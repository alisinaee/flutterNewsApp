import 'package:ako_demo/src/Widgets/spacer_widget.dart';
import 'package:flutter/material.dart';

Widget infoWidget({
  required IconData icon,
  required String txt,
}) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.white24,
        size: 18,
      ),
      spacerWidget(width: 5),
      Text(
        txt,
        style: const TextStyle(color: Colors.white30, fontSize: 12),
      ),
    ],
  );
}
