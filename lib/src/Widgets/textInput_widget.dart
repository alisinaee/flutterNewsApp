import 'dart:ui';

import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final double width;
  final double height;
  final TextEditingController controller;
  final String errorTxt;

  const TextInputWidget({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.isPassword,
    required this.isEmail,
    required this.width,
    required this.height,
    required this.controller,
    required this.errorTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 30,
              sigmaX: 30,
            ),
            child: Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.07),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 0.2),
              ),
              child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white.withOpacity(.8)),
                cursorColor: Colors.white,
                obscureText: isPassword,
                keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    icon,
                    color: Colors.white.withOpacity(.7),
                  ),
                  border: InputBorder.none,
                  hintMaxLines: 1,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
                ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: (errorTxt != '') ? 25 : 0,
          width: (errorTxt != '') ? 120 : 0,
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black54,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              errorTxt,
              softWrap: false,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amber.withOpacity(0.85),
                fontSize: 11,
              ),
            ),
          ),
        )
      ],
    );
  }
}
