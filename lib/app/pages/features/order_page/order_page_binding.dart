import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/explore_page/explore_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/order_page_controller.dart';




class OrderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPageController>(() => OrderPageController());
  }
}