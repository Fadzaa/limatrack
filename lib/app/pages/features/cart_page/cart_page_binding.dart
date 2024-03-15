import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_controller.dart';

class CartPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartPageController>(() => CartPageController());
  }
}