import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ExplorePageController extends GetxController {

  RxInt currentIndex = 0.obs;

  List list_filter = [
    "Terdekat",
    "Rating 4.5 +",
    "Verifikasi Halal"
  ];

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }


}