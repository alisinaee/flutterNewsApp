import 'package:ako_demo/src/Widgets/post_widget/widgets/authorInfo_widget.dart';
import 'package:ako_demo/src/Widgets/post_widget/widgets/description_widget.dart';
import 'package:ako_demo/src/Widgets/post_widget/widgets/mainImg_widget.dart';
import 'package:ako_demo/src/Widgets/post_widget/widgets/smallInfo_widget.dart';
import 'package:ako_demo/src/Widgets/spacer_widget.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String descriptionTxt;
  final String authorTxt;
  final String dateTxt;
  final String logoTxt;
  final String? imgAddress;
  final String? imgUrl;

  const PostWidget({
    Key? key,
    required this.descriptionTxt,
    required this.authorTxt,
    required this.dateTxt,
    required this.logoTxt,
    required this.imgAddress,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(15),
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 0.5,
          color: Colors.white54,
        ),
      ),
      child: Column(
        children: [
          authorInfoWidget(authorTxt: authorTxt, dateTxt: dateTxt, logoTxt: logoTxt),
          spacerWidget(height: 20),
          mainImgWidget(imgAddress: imgAddress, imgUrl: imgUrl),
          spacerWidget(height: 20),
          descriptionWidget(descriptionTxt),
          spacerWidget(height: 20),
          smallInfoWidget(),
        ],
      ),
    );
  }
}
