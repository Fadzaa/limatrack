import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:limatrack_genetic/app/api/authentication_service.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  AuthenticationService authenticationService = AuthenticationService();


  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
          emailController.text,
          passwordController.text
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!" );
      Get.offAllNamed(Routes.HOME_PAGE);



    } catch (e) {
      isLoading(true);
      Get.snackbar("Login Error", "Invalid Username or Password");
      print(e);

    } finally {
      isLoading(false);
    }
  }

}