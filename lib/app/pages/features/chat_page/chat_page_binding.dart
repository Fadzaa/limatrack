import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/chat_page/chat_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/explore_page/explore_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/order_page_controller.dart';




class ChatPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatPageController>(() => ChatPageController());
  }
}