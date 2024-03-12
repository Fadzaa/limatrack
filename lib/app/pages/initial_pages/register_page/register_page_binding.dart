import 'package:get/get.dart';

import 'register_page_controller.dart';


class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterPageController>(() => RegisterPageController());
  }
}