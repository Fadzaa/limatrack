import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/chat_page/chat_page_binding.dart';
import 'package:limatrack_genetic/app/pages/features/explore_page/explore_page_binding.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/bottom_navigation.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_binding.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_view.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_binding.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_view.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/home_page_binding.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/order_page_binding.dart';
import 'package:limatrack_genetic/app/pages/features/payment_page/payment_success_page.dart';
import 'package:limatrack_genetic/app/pages/features/payment_page/rincian_pembayaran_page.dart';
import 'package:limatrack_genetic/app/pages/features/profile_page/profile_page_binding.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/login_page/login_page_binding.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/login_page/login_page_view.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/onboarding_page/onboarding_page_binding.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/onboarding_page/onboarding_page_view.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/otp_verification_page/otp_page_binding.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/otp_verification_page/otp_page_view.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/splash_screen/splash_page_binding.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/splash_screen/splash_page_view.dart';

import '../pages/initial_pages/register_page/register_page_binding.dart';
import '../pages/initial_pages/register_page/register_page_view.dart';

part 'app_routes.dart';

class AppPages {
  // static var routes;

  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => BottomNavigation(),
      bindings:  [
        HomePageBinding(),
        ExplorePageBinding(),
        OrderPageBinding(),
        ChatPageBinding(),
        ProfilePageBinding()
      ],
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
      name: _Paths.REGISTER_PAGE,
      page: () => const RegisterPageView(),
      binding: RegisterPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION_PAGE,
      page: () => const OtpPageView(),
      binding: OtpPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DETAIL_DAGANG_PAGE,
      page: () => const DetailPageView(),
      binding: DetailPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => const CartPageView(),
      binding: CartPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ORDER_SUCCESS_PAGE,
      page: () => const PaymentSuccessPage(isOrder: true),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS_PAGE,
      page: () => const PaymentSuccessPage(isOrder: false),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DETAIL_PAYMENT_PAGE,
      page: () => const RincianPembayaranPage(),
      transition: Transition.noTransition,
    ),

  ];
}