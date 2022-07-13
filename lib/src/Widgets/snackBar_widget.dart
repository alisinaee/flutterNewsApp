import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBarWidget(String txt) {
  Get.snackbar(
    'Alert',
    txt,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.amber,
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(20),
  );
}
