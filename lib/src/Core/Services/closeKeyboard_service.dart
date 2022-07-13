import 'package:flutter/material.dart';

void closeKeyboardService() {
  FocusManager.instance.primaryFocus?.unfocus();
}
