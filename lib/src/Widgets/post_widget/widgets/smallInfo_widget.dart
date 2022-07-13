import 'package:ako_demo/src/Widgets/post_widget/widgets/info_widget.dart';
import 'package:ako_demo/src/Widgets/spacer_widget.dart';
import 'package:flutter/material.dart';

Widget smallInfoWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          infoWidget(txt: '12K', icon: Icons.favorite_outline),
          spacerWidget(width: 25),
          infoWidget(txt: '213', icon: Icons.mode_comment_outlined),
          spacerWidget(width: 25),
          infoWidget(txt: '140K', icon: Icons.remove_red_eye_outlined),
        ],
      ),
      const Icon(
        Icons.share_outlined,
        color: Colors.white24,
        size: 18,
      ),
    ],
  );
}
