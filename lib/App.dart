import 'package:ako_demo/src/Core/Routes/routes.dart';
import 'package:ako_demo/src/Core/Services/customScrollBehavior_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AKO NEWS',
      getPages: RouteClass().getRouteList,
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData(
        fontFamily: GoogleFonts.exo().fontFamily,
      ),
      //
      initialRoute: "/",
      //initialRoute: "/login",
    );
  }
}
