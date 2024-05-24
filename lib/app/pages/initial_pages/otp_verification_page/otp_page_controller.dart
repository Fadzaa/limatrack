import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/auth/service/authentication_service.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpPageController extends GetxController {
  late Rx<TextEditingController> otpNumberController;

  late AuthenticationService authenticationService;
  RxBool isLoading = false.obs;

  RxBool isEnabled = false.obs;

  var arguments = Get.arguments;

  //Initial String Value
  RxString countDown = '00:00'.obs;

  RxInt count = 300.obs;

  @override
  void onInit() {
    otpNumberController = TextEditingController().obs;

    authenticationService = AuthenticationService();
    super.onInit();

    startTimer();
  }


  void startTimer() {

    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (count.value == 0) {
        timer.cancel();
      } else {
        count.value--;
        int minute = int.parse(countDown.value.split(':')[0]);
        int second = int.parse(countDown.value.split(':')[1]);
        minute = count.value ~/ 60;
        second = count.value % 60;

        if(second < 10) {
          countDown.value = '0$minute:0$second';
        } else {
          countDown.value = '0$minute:$second';
        }
      }
    });
  }

  Future<void> register() async {
    try {
      isLoading(true);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await authenticationService.register(
        arguments['name'], arguments['email'], arguments['password'], otpNumberController.value.text
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

  Future<void> otpVerification() async {

    try {
      isLoading(true);
      // await authenticationService.otpVerification(arguments['email']);
      await authenticationService.otpVerification("fadza20@gmail.com");

      Get.snackbar('Success', 'OTP has been sent to your email');

    } catch (e) {
      isLoading(true);
      Get.snackbar('Register Error', 'Network Error');
    } finally {
      isLoading(false);
    }
  }

}