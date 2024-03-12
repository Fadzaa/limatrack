import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';

class OnboardingPageController extends GetxController {

  late PageController pageController;
  RxInt pageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
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

  void nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void skipOnboarding() {
    Get.offAllNamed(Routes.HOME_PAGE);
  }

  void onPressedButton() {
    if (pageIndex.value == 2) {
      Get.offAllNamed(Routes.HOME_PAGE);
    } else {
      nextPage();
    }
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }




}