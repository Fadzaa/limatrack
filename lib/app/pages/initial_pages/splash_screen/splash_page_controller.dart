import 'package:get/get.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkFirstLaunch();
  }

  void checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      Get.offNamed(Routes.ONBOARDING_PAGE);

      await prefs.setBool('isFirstLaunch', false);
    } else {
      final token = prefs.getString('token');
      if (token != null) {
        Get.offAllNamed(Routes.HOME_PAGE);
      } else {
        Get.offAllNamed(Routes.LOGIN_PAGE);
      }
    }
  }
}