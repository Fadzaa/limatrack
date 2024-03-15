import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan.dart';


class DetailPageController extends GetxController {
  RxInt total = 0.obs;
  RxInt totalPrice = 0.obs;

  List<Jajan> data_jajan = [];

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

  void initialAddCounter(RxInt counter, Jajan jajan) {
    data_jajan.add(jajan);
    counter.value++;
    total.value++;
    totalPrice.value += jajan.price;
  }

  // void addDataJajan(RxInt counter, Jajan jajan) {
  //   data_jajan.add(jajan);
  //   counter.value++;
  //   total.value++;
  //   totalPrice.value += jajan.price;
  // }

  void removeDataJajan(RxInt counter, Jajan jajan) {
    data_jajan.remove(jajan);
    counter.value--;
    total.value--;
    totalPrice.value -= jajan.price;
  }


}