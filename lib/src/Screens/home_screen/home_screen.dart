import 'package:ako_demo/src/Core/Data/Models/post_model.dart';
import 'package:ako_demo/src/Widgets/appBar_widget.dart';
import 'package:ako_demo/src/Widgets/post_widget/post_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final List<PostModel> posts;

  const HomeScreen({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff192028),
      appBar: appBarWidget(),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(
            imgAddress: posts[index].imgAddress,
            authorTxt: posts[index].author,
            dateTxt: posts[index].date,
            descriptionTxt: posts[index].description,
            imgUrl: posts[index].imgUrl,
            logoTxt: posts[index].authorImgAddress,
          );
        },
      ),
    );
  }
}
