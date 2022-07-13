import 'package:ako_demo/App.dart';
import 'package:ako_demo/src/Core/Services/run_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  //runServices();
  await RunServices.run();

  //
  runApp(
    Phoenix(
      child: const App(),
    ),
  );

  //change the style of status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}
