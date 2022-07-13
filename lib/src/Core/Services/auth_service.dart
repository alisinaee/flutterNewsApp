import 'package:ako_demo/src/Core/Controllers/auth_controller.dart';
import 'package:ako_demo/src/Core/Services/storage_service.dart';
import 'package:get/get.dart';

class AuthService {
  //add auth controller
  final AuthController authController = Get.put(AuthController());

  AuthService() {
    if (isUserLoggedIn()) {
      authController.getNewsFunc();
    } else {
      Get.toNamed('/login');
    }
  }

  //check if user logged in
  bool isUserLoggedIn() {
    return (StorageService.readSession() != null && StorageService.readSession()!);
  }
}
