import 'package:get/get.dart';

import 'otp_page_controller.dart';


class OtpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpPageController>(() => OtpPageController());
  }
}