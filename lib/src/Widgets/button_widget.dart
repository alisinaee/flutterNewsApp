import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? func;
  final double height;
  final double? width;
  final String text;
  final bool? isLoading;

  const ButtonWidget({
    Key? key,
    this.func,
    required this.height,
    required this.text,
    this.width,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: func ?? () {},
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.07),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 0.2),
            ),
            child: isLoading != null && isLoading!
                ? const CircularProgressIndicator(
                    color: Colors.white30,
                  )
                : Text(
                    text,
                    style: TextStyle(color: Colors.white.withOpacity(.8)),
                  ),
          ),
        ),
      ),
    );
  }
}
