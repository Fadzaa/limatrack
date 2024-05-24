import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/auth/service/authentication_service.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';

class RegisterPageController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPassController;

  late AuthenticationService authenticationService;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();

    authenticationService = AuthenticationService();
    super.onInit();
  }

  Future<void> otpVerification() async {

    try {
      isLoading(true);
      await authenticationService.otpVerification(emailController.text);


      Get.snackbar('Success', 'OTP has been sent to your email');

      Get.toNamed(Routes.OTP_VERIFICATION_PAGE, arguments: {
        'name': nameController.text, // 'name': 'nameController.text
        'email': emailController.text,
        'password': confirmPassController.text

      });

    } catch (e) {
      isLoading(true);
      Get.snackbar('Register Error', 'Network Error');
    } finally {
      isLoading(false);
    }
  }


}

// void validateForm() {
//   if (nameController.text.isEmpty) {
//     Get.snackbar('Error', 'Name is required');
//   } else if (emailController.text.isEmpty) {
//     Get.snackbar('Error', 'Email is required');
//   } else if (passwordController.text.isEmpty) {
//     Get.snackbar('Error', 'Password is required');
//   } else if (confirmPassController.text.isEmpty) {
//     Get.snackbar('Error', 'Confirm Password is required');
//   } else if (passwordController.text != confirmPassController.text) {
//     Get.snackbar('Error', 'Password does not match');
//   } else {
//     Get.snackbar('Success', 'Form is valid');
//     Get.toNamed(Routes.OTP_VERIFICATION_PAGE);
//   }
// }