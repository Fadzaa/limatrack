import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/home_page_binding.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/home_page_view.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/login_page/login_page_binding.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/login_page/login_page_view.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/onboarding_page/onboarding_page_binding.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/onboarding_page/onboarding_page_view.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/splash_screen/splash_page_binding.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/splash_screen/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  // static var routes;

  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => const SplashPageView(),
      binding: SplashPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ONBOARDING_PAGE,
      page: () => const OnboardingPageView(),
      binding: OnboardingPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
      transition: Transition.noTransition,
    ),
  ];
}