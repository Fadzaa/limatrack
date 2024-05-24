import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/langganan_page/langganan_page_controller.dart';

class LanggananPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanggananPageController>(() => LanggananPageController());
  }
}