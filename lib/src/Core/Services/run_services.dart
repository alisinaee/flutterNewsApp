import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:window_manager/window_manager.dart';

class RunServices {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    //run storage service
    await GetStorage.init();

    //
    // Must add this line.
    if (Platform.isWindows) {
      await windowManager.ensureInitialized();

      WindowOptions windowOptions = const WindowOptions(
        size: Size(500, 800),
        center: true,
        backgroundColor: Colors.transparent,
        titleBarStyle: TitleBarStyle.normal,
        title: 'Ako News',
        minimumSize: Size(450, 400),
        maximumSize: Size(550, 3000),

        //skipTaskbar: false,
      );
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    }
  }
}
