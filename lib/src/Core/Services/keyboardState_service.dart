import 'package:flutter/material.dart';

bool isKeyboardOpen(BuildContext context) {
  final bool _isKeyboardClosed = MediaQuery.of(context).viewInsets.bottom == 0;
  return !_isKeyboardClosed;
}
