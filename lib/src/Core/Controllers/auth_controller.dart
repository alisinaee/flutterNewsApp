import 'package:ako_demo/src/Core/Data/FakeData/fakeData.dart';
import 'package:ako_demo/src/Core/Data/Models/news_model.dart';
import 'package:ako_demo/src/Core/Data/Models/post_model.dart';
import 'package:ako_demo/src/Core/Data/Repository/home_repo/getNews_repo.dart';
import 'package:ako_demo/src/Core/Services/storage_service.dart';
import 'package:ako_demo/src/Screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //inputs
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //error txt
  final RxString usernameError = ''.obs;
  final RxString passwordError = ''.obs;

  //
  RxBool isLoading = false.obs;

  //login btn function
  void loginBtnFunc() {
    //wait to finish previews request
    if (isLoading.value) {
      return;
    }
    //first check for validate
    if (!_validateInputs()) {
      return;
    } else {
      StorageService.writeSession(true);
    }
    getNewsFunc();
  }

  //logout btn function
  void logoutBtnFunc() {
    StorageService.logout();
    Get.toNamed('/');
  }

  //get news
  void getNewsFunc() async {
    //active loading
    isLoading.value = true;
    //feedback
    HapticFeedback.lightImpact();

    //get model from net
    NewsModel? news = await NewsRepo().getNews();
    //deactivate loading
    isLoading.value = false;
    //check data
    if (news != null) {
      //convert news to post
      List<PostModel> posts = [];
      List.generate(news.results!.length, (index) {
        if (news.results![index].imageUrl != null) {
          posts.add(
            PostModel(
              authorImgAddress: 'Assets/logo.jpg',
              imgAddress: null,
              author: 'Ako Member',
              date: news.results![index].pubDate!,
              imgUrl: news.results![index].imageUrl,
              title: news.results![index].title!,
              description: news.results![index].description != null
                  ? news.results![index].description!
                  : FakeData.leremText,
            ),
          );
        }
      });
      //go to home screen
      Get.to(HomeScreen(posts: posts));
    } else {
      //show error
    }
  }

  //private func -----------------------------

  //validation
  bool _validateInputs() {
    final bool isUserNameValid = _validateUserName();
    final bool isPasswordValid = _validatePassword();
    return isUserNameValid && isPasswordValid;
  }

  //validate user name
  bool _validateUserName() {
    if (userNameController.text == FakeData.authKey) {
      usernameError.value = '';
      return true;
    } else {
      usernameError.value = 'invalid user name !';
      return false;
    }
  }

  //validate password
  bool _validatePassword() {
    if (passwordController.text == FakeData.authKey) {
      passwordError.value = '';
      return true;
    } else {
      passwordError.value = 'invalid password!';
      return false;
    }
  }
}
