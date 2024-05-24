import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/model/jajanan_local_model.dart';


class CartPageController extends GetxController {
  RxInt total = 0.obs;
  RxInt totalPrice = 0.obs;

  RxInt selectedIndex = 0.obs;

  List<JajananLocalModel> jajan_data = Get.arguments[0];
  WarungModel warung = Get.arguments[1];


  @override
  void onInit() {
    super.onInit();

    for (int i = 0; i < jajan_data.length; i++) {
      print(jajan_data[i].id);
      print(jajan_data[i].total);
    }

    totalPrice.value = jajan_data.fold(0, (previousValue, element) => previousValue + (element.total * element.harga));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  int getTotalPrice() {
    double adminPrice = totalPrice.value * 5 / 100;
    return totalPrice.value + adminPrice.toInt();
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