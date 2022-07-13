import 'dart:ui';

import 'package:ako_demo/src/Animations/controller/bubble_animation.dart';
import 'package:ako_demo/src/Core/Controllers/auth_controller.dart';
import 'package:ako_demo/src/Widgets/button_widget.dart';
import 'package:ako_demo/src/Widgets/logo_widget.dart';
import 'package:ako_demo/src/Widgets/spacer_widget.dart';
import 'package:ako_demo/src/Widgets/textInput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  //size setting
  final double inputWidthSize = 370;
  final double inputHeightSize = 60;

  LoginScreen({Key? key}) : super(key: key) {
    //AuthService();
  }

  //add auth controller
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff192028),
      body: SizedBox(
        height: size.height,
        child: BubbleAnimation(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  spacerWidget(height: 20),
                  logoWidget(),
                  spacerWidget(height: 40),
                  Obx(() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextInputWidget(
                          controller: authController.userNameController,
                          icon: Icons.account_circle_outlined,
                          hintText: 'User name...',
                          isEmail: false,
                          isPassword: false,
                          width: inputWidthSize,
                          height: inputHeightSize,
                          errorTxt: authController.usernameError.value,
                        ),
                        spacerWidget(height: 20),
                        TextInputWidget(
                          controller: authController.passwordController,
                          icon: Icons.lock_outline,
                          hintText: 'Password...',
                          isEmail: false,
                          isPassword: true,
                          width: inputWidthSize,
                          height: inputHeightSize,
                          errorTxt: authController.passwordError.value,
                        ),
                        spacerWidget(height: 60),
                        Center(
                          child: SizedBox(
                            width: inputWidthSize,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ButtonWidget(
                                    height: inputHeightSize,
                                    text: 'LOGIN',
                                    func: authController.loginBtnFunc,
                                    isLoading: authController.isLoading.value,
                                  ),
                                ),
                                spacerWidget(width: 20),
                                Expanded(
                                  child: ButtonWidget(
                                    height: inputHeightSize,
                                    text: 'Demo !',
                                    func: () {
                                      HapticFeedback.lightImpact();
                                      Get.toNamed('/home');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  spacerWidget(height: 60),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonWidget(
                        height: inputHeightSize,
                        width: inputWidthSize,
                        text: 'Create a new Account',
                        func: () {},
                      ),
                      spacerWidget(height: 10),
                      const Text(
                        'Copyright © Ali Sinaee 2022. All rights reserved.',
                        style: TextStyle(color: Colors.white30, fontSize: 10),
                      ),
                      spacerWidget(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
