import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/login_page/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}