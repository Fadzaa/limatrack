import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/pedagang/service/pedagang_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/pedagang/model/pedagang.dart';


class HomePageController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;

  RxBool isLoading = true.obs;

  Pedagang? pedagang;

  // late PedagangService pedagangService;
  // List<Data> listPedagang = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    // pedagangService = PedagangService();
    // fetchPedagangAll();
  }




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }


  // Future<void> fetchPedagangAll() async {
  //   try {
  //     isLoading.value = true;
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String token = prefs.getString('token').toString();
  //     final response = await pedagangService.getPedagangAll(token, false, 4.5, false);
  //
  //     if (response.statusCode == 200) {
  //       pedagang = Pedagang.fromJson(response.data);
  //       listPedagang = pedagang.data;
  //       Get.snackbar("Fetch Success", listPedagang.toString());
  //
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar("Network Error", e.toString());
  //
  //   } finally {
  //     isLoading.value = false;
  //   }
  //
  // }

}