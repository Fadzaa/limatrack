import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/authentication_service.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePageController extends GetxController {
  RxBool isLoading = false.obs;
  AuthenticationService authenticationService = AuthenticationService();


  Future<void> logout() async {
    try {
      isLoading.value = true;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      await authenticationService.logout(token!);
      prefs.remove('token');

      Get.snackbar("Logout Success", "You have been logged out");
      Get.offAllNamed(Routes.LOGIN_PAGE);

    } catch (e) {
      isLoading.value = true;
      Get.snackbar("Logout Failed", "Network Error" + e.toString());
    } finally {
      isLoading.value = false;
    }
  }


}