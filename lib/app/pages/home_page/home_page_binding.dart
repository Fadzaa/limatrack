
import 'package:get/get.dart';

import 'package:limatrack_genetic/app/pages/home_page/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}