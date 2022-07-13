import 'package:flutter/material.dart';

Widget mainImgWidget({required String? imgAddress, required String? imgUrl}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: (imgAddress == null)
                ? NetworkImage(imgUrl!)
                : AssetImage(imgAddress) as ImageProvider,
            fit: BoxFit.cover),
      ),
    ),
  );
}
