import 'dart:async';

import 'package:ako_demo/src/Widgets/circlePainter_widget.dart';
import 'package:flutter/material.dart';

class BubbleAnimation extends StatefulWidget {
  final Widget child;

  const BubbleAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _BubbleAnimationState createState() => _BubbleAnimationState();
}

class _BubbleAnimationState extends State<BubbleAnimation> with TickerProviderStateMixin {
  //controllers
  late AnimationController controller1;
  late AnimationController controller2;

  //animations
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  //
  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: size.height * (animation2.value + .58),
          left: size.width * .10,
          child: CustomPaint(
            painter: CirclePainter(50),
          ),
        ),
        Positioned(
          top: size.height * .98,
          left: size.width,
          child: CustomPaint(
            painter: CirclePainter(animation4.value - 50),
          ),
        ),
        Positioned(
          top: size.height * .5,
          left: size.width * (animation2.value + .8),
          child: CustomPaint(
            painter: CirclePainter(30),
          ),
        ),
        Positioned(
          top: size.height * animation3.value,
          left: size.width * (animation1.value + .1),
          child: CustomPaint(
            painter: CirclePainter(60),
          ),
        ),
        Positioned(
          top: 0,
          right: size.width,
          child: CustomPaint(
            painter: CirclePainter(animation4.value),
          ),
        ),
        Positioned(
            top: animation1.value * 700,
            right: 100,
            left: 100,
            child: Align(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage('Assets/logo.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                ),
              ),
            )),
        SizedBox(
          height: size.height,
          child: Center(
            child: widget.child,
          ),
        )
      ],
    );
  }
}
