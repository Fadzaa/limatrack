part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_PAGE = _Paths.SPLASH_PAGE;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const ONBOARDING_PAGE = _Paths.ONBOARDING_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_PAGE = '/';
  static const HOME_PAGE = '/home-page';
  static const ONBOARDING_PAGE = '/onboarding-page';
}