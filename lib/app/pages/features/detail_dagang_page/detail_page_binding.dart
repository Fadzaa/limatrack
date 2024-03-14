import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_controller.dart';

class DetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPageController>(() => DetailPageController());
  }
}