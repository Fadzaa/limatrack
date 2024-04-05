import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/auth/authentication_service.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpPageController extends GetxController {
  late TextEditingController otpNumberController;

  late AuthenticationService authenticationService;
  RxBool isLoading = false.obs;

  var arguments = Get.arguments;

  @override
  void onInit() {
    otpNumberController = TextEditingController();

    authenticationService = AuthenticationService();
    super.onInit();
  }

  Future<void> register() async {
    try {
      isLoading(true);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await authenticationService.register(
        arguments['name'], arguments['email'], arguments['password'], otpNumberController.text
      );

      prefs.setString('token', response.data['token']);

      Get.snackbar("Register Success", "Your Account Registered Successfully");
      Get.offAllNamed(Routes.HOME_PAGE);

    } catch (e) {
      isLoading(false);
      Get.snackbar("Register Failed", "Network Error" + e.toString());
    }finally {
      isLoading(false);
    }
  }

}