import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/explore_page/explore_page_controller.dart';




class ExplorePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExplorePageController>(() => ExplorePageController());
  }
}