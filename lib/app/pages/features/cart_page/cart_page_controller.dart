import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartPageController extends GetxController {
  RxInt total = 0.obs;
  RxInt totalPrice = 0.obs;

  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }


  void incrementCounter(RxInt counter, RxInt price) {
    counter.value++;
    total.value++;
    totalPrice.value += price.value;
  }

  void decrementCounter(RxInt counter, RxInt price) {
    counter.value--;
    total.value--;
    totalPrice.value -= price.value;
  }

  void initialAddCounter(RxInt counter, RxInt price) {
    counter.value++;
    total.value++;
    totalPrice.value += price.value;
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }



}