import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderPageController extends GetxController with SingleGetTickerProviderMixin {

  TabController? tabController;


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();

  }



}