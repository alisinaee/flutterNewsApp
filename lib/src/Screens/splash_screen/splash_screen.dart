import 'package:ako_demo/src/Animations/controller/bubble_animation.dart';
import 'package:ako_demo/src/Core/Services/auth_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  //
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //check user auth status
    WidgetsBinding.instance.addPostFrameCallback((_) => AuthService());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: BubbleAnimation(child: Container()),
    );
  }
}
