import 'package:ako_demo/src/Core/Data/FakeData/fakeData.dart';
import 'package:ako_demo/src/Screens/home_screen/home_screen.dart';
import 'package:ako_demo/src/Screens/login_screen/login_screen.dart';
import 'package:ako_demo/src/Screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class RouteClass {
  final List<GetPage<dynamic>> _routeList = [
    //
    GetPage(name: "/", page: () => const SplashScreen()),
    //
    GetPage(name: "/login", page: () => LoginScreen()),
    //
    GetPage(name: "/home", page: () => HomeScreen(posts: FakeData.posts)),
  ];

  List<GetPage<dynamic>> get getRouteList => _routeList;
}
