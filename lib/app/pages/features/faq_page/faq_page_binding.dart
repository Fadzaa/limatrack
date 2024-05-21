import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/home_page_controller.dart';

import 'faq_page_controller.dart';

class FaqPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqPageController>(() => FaqPageController());
  }
}