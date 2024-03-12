import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/splash_screen/splash_page_controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashPageController());
  }
}