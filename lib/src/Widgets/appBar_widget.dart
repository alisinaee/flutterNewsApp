import 'package:ako_demo/src/Core/Controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget? appBarWidget() {
  //add auth controller
  final AuthController authController = Get.put(AuthController());
  //
  return PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: AppBar(
      backgroundColor: Colors.black.withOpacity(0.6),
      title: const Text(
        'AKO',
        style: TextStyle(
          color: Colors.amber,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 10,
          wordSpacing: 10,
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      /*leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Get.back(),
      ),*/
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: () => authController.logoutBtnFunc(),
        )
      ],
    ),
  );
}
