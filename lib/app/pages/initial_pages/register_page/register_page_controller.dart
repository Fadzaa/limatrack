import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';

class RegisterPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  RxString username = ''.obs;

  @override
  void onInit() {
    super.onInit();


  }

  void getName() {
    username.value = nameController.text;
    print(nameController.text);

  }

  void validateForm() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Name is required');
    } else if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email is required');
    } else if (passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else if (confirmPassController.text.isEmpty) {
      Get.snackbar('Error', 'Confirm Password is required');
    } else if (passwordController.text != confirmPassController.text) {
      Get.snackbar('Error', 'Password does not match');
    } else {
      Get.snackbar('Success', 'Form is valid');
      Get.toNamed(Routes.OTP_VERIFICATION_PAGE);
    }
  }


}