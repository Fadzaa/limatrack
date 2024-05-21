import 'package:get/get.dart';

class FaqPageController extends GetxController {
  RxList<bool> listOpen = <bool>[].obs;

  RxBool singleOpen = false.obs;



  @override
  void onInit() {
    super.onInit();

  }

  void toggle(int index, bool isOpen) {
    listOpen[index] = !isOpen;
  }



}