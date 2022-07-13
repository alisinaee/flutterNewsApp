import 'package:get_storage/get_storage.dart';

class StorageService {
  //keys
  static const String _isLoggedIn = "isLoggedIn";
  //

  //storage
  static final _storage = GetStorage();

  StorageService() {
    GetStorage.init();
  }

  //-------------------------

  //write user first name on storage
  static void writeSession(bool status) {
    _storage.write(_isLoggedIn, status);
  }

  //-------------------------

  //reade first name on storage
  static bool? readSession() {
    return _storage.read(_isLoggedIn);
  }

  //-----------------------------
  //logout
  static void logout() {
    _storage.erase();
  }
}
