import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/splash_screen/splash_page_controller.dart';
import 'package:limatrack_genetic/common/constant.dart';

class SplashPageView extends GetView<SplashPageController> {
  const SplashPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          logoPrimary,
          width: 150,
          height: 150,
        )
      ),
    );
  }
}

