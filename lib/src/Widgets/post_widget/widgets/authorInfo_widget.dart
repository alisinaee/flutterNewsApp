import 'package:ako_demo/src/Widgets/spacer_widget.dart';
import 'package:flutter/material.dart';

Widget authorInfoWidget({
  required String logoTxt,
  required String authorTxt,
  required String dateTxt,
}) {
  return Row(
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white30,
            image: DecorationImage(
              image: AssetImage(logoTxt),
            )),
        //child: Image.asset('Assets/logo.jpg'),
      ),
      spacerWidget(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            authorTxt,
            style: const TextStyle(color: Colors.white60),
          ),
          Text(
            dateTxt,
            style: const TextStyle(color: Colors.white30, fontSize: 10),
          ),
        ],
      ),
    ],
  );
}
