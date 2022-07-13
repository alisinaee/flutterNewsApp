import 'dart:async';
import 'dart:io';

import 'package:ako_demo/src/Widgets/snackBar_widget.dart';
import 'package:http/http.dart' as http;

abstract class HttpService {
  Future<http.Response> getRequest(String url);
}

class Connection implements HttpService {
  @override
  Future<http.Response> getRequest(String url) async {
    try {
      return await http.get(
        Uri.parse(url),
        headers: {
          'X-ACCESS-KEY': 'pub_9063158454e391ac10f23cb91f1da671de2c',
        },
      ).timeout(const Duration(milliseconds: 5000), onTimeout: () {
        // Time has run out
        snackBarWidget('time out!');
        return http.Response('Error', 408);
      });
    } on SocketException catch (_) {
      // Other exception
      snackBarWidget('internet problem!');
      return http.Response('Error', 408);
    }
  }
}
